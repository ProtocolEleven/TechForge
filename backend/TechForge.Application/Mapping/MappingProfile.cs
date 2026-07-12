using AutoMapper;
using TechForge.Application.DTOs;
using TechForge.Domain.Entities;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace TechForge.Application.Mapping;

public class MappingProfile : Profile
{
    public MappingProfile()
    {
        CreateMap<Product, ProductDto>()
            .ForMember(
                dest => dest.Brand,
                opt => opt.MapFrom(src => src.Brand.Name))
            .ForMember(
                dest => dest.Category,
                opt => opt.MapFrom(src => src.Category.Name));

        CreateMap<CreateProductDto, Product>();

        CreateMap<UpdateProductDto, Product>();

        CreateMap<Product, UpdateProductDto>();
    }
}