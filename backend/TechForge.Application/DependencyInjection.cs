using AutoMapper;
using FluentValidation;
using Microsoft.Extensions.DependencyInjection;
using TechForge.Application.DTOs;
using TechForge.Application.Mapping;
using TechForge.Application.Services;
using TechForge.Application.Services.Interfaces;
using TechForge.Application.Validators;

namespace TechForge.Application;

public static class DependencyInjection
{
    public static IServiceCollection AddApplication(
        this IServiceCollection services)
    {
        services.AddAutoMapper(_ => { }, typeof(MappingProfile).Assembly);

        services.AddScoped<IProductService, ProductService>();
        services.AddScoped<IValidator<CreateProductDto>, CreateProductDtoValidator>();
        services.AddScoped<IValidator<UpdateProductDto>, UpdateProductDtoValidator>();
        return services;
    }
}