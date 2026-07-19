using AutoMapper;
using Microsoft.Extensions.DependencyInjection;
using TechForge.Application.Mapping;

namespace TechForge.Application;

public static class DependencyInjection
{
    public static IServiceCollection AddApplication(
        this IServiceCollection services)
    {

        return services;
    }
}