using TechForge.API.Extensions;
using TechForge.Application;
using TechForge.Application.Interfaces;
using TechForge.Application.Interfaces.Persistance;
using TechForge.Application.Services;
using TechForge.Application.Services.Interfaces;
using TechForge.Infrastructure;
using TechForge.Infrastructure.Extensions;
using TechForge.Infrastructure.Repositories;
using TechForge.Infrastructure.Services;
using TechForge.Application.Settings;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using TechForge.Application.Settings;
using Microsoft.OpenApi.Models;

var builder = WebApplication.CreateBuilder(args);

var jwtSettings = builder.Configuration
    .GetSection("Jwt")
    .Get<JwtSettings>()
    ?? throw new InvalidOperationException(
        "JWT settings are not configured.");

// Add services
builder.Services.AddControllers();

builder.Services.AddScoped<IProductService, ProductService>();

builder.Services.AddScoped<IProductRepository, ProductRepositories>();

builder.Services.AddScoped<IPasswordHasher, PasswordHasher>();

builder.Services.AddScoped<IUserRepository, UserRepository>();

builder.Services.AddScoped<IAuthService, AuthService>();

builder.Services.Configure<JwtSettings>(builder.Configuration.GetSection("Jwt"));

builder.Services.AddScoped<ITokenService, TokenService>();

builder.Services
    .AddAuthentication(options =>
    {
        options.DefaultAuthenticateScheme =
            JwtBearerDefaults.AuthenticationScheme;

        options.DefaultChallengeScheme =
            JwtBearerDefaults.AuthenticationScheme;
    })
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters =
            new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,

                IssuerSigningKey =
                    new SymmetricSecurityKey(
                        Encoding.UTF8.GetBytes(jwtSettings.Key)),

                ValidateIssuer = true,
                ValidIssuer = jwtSettings.Issuer,

                ValidateAudience = true,
                ValidAudience = jwtSettings.Audience,

                ValidateLifetime = true,

                ClockSkew = TimeSpan.Zero
            };
    });

builder.Services.AddAuthorization();

// Swagger/OpenAPI
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddSwaggerGen(options =>
{
options.AddSecurityDefinition(
    "Bearer",
    new OpenApiSecurityScheme
    {
        Name = "Authorization",
        Type = SecuritySchemeType.Http,
        Scheme = "bearer",
        BearerFormat = "JWT",
        In = ParameterLocation.Header,
        Description = "Enter your JWT token below."
    });

options.AddSecurityRequirement(
    new OpenApiSecurityRequirement
    {
            {
                new OpenApiSecurityScheme
                {
                    Reference = new OpenApiReference
                    {
                        Type = ReferenceType.SecurityScheme,
                        Id = "Bearer"
                    }
                },
                Array.Empty<string>()
            }
    });
});

builder.Services.AddInfrastructure(builder.Configuration);

builder.Services.AddApplication();


var app = builder.Build();

// Configure middleware
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseGlobalExceptionHandling();

app.UseHttpsRedirection();

app.UseAuthentication();

app.UseAuthorization();

app.MapControllers();

app.Run();