using AutoMapper;
using Microsoft.Extensions.DependencyInjection;
using TechForge.Application.Mapping;
using TechForge.Application.Services;
using TechForge.Application.Services.Interfaces;

namespace TechForge.Application;

public static class DependencyInjection
{
    public static IServiceCollection AddApplication(
        this IServiceCollection services)
    {
        services.AddAutoMapper(_ => { }, typeof(MappingProfile).Assembly);

        services.AddScoped<IProductService, ProductService>();
        return services;
    }
}