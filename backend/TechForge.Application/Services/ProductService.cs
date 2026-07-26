using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechForge.Application.DTOs;
using TechForge.Application.Interfaces.Persistance;
using TechForge.Application.Services.Interfaces;
using TechForge.Domain.Entities;

namespace TechForge.Application.Services
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _productRepository;
        private readonly IMapper _mapper;

        private readonly IValidator<CreateProductDto> _createValidator;
        private readonly IValidator<UpdateProductDto> _updateValidator;

        public ProductService(IProductRepository productRepository, IMapper mapper, IValidator<CreateProductDto> createValidator, IValidator<UpdateProductDto> updateValidator)
        {
            _productRepository = productRepository; 
            _mapper = mapper;
            _createValidator = createValidator;
            _updateValidator = updateValidator;

        }

        public async Task<int> CreateAsync(CreateProductDto dto)
        {

            var validationResult = await _createValidator.ValidateAsync(dto);

            if (!validationResult.IsValid) 
            {
                throw new ValidationException(validationResult.Errors);
            }

            if(await _productRepository.ExistsBySkuAsync(dto.SKU))
            {
                throw new InvalidOperationException("SKU already exists!");
            }

            var product = _mapper.Map<Product>(dto);

            await _productRepository.AddAsync(product);

            await _productRepository.SaveChangesAsync();

            return product.Id;
        }

        public async Task DeleteAsync(int id)
        {
            var product = await _productRepository.GetByIdAsync(id);
            if (product == null) { throw new KeyNotFoundException("Product not found!"); }

            await _productRepository.DeleteAsync(product);

            await _productRepository.SaveChangesAsync();

        }

        public async Task<IEnumerable<ProductDto>> GetAllAsync()
        {
            var products = await _productRepository.GetAllAsync();

            return _mapper.Map<IEnumerable<ProductDto>>(products);
        }

        public async Task<ProductDto?> GetProductByIdAsync(int id)
        {
            var product = await _productRepository.GetByIdAsync(id);

            if (product == null) { return null; }

            return _mapper.Map<ProductDto>(product);
        }

        public async Task UpdateAsync(int id, UpdateProductDto dto)
        {
            var validationResult = await _updateValidator.ValidateAsync(dto);

            if (!validationResult.IsValid)
            {
                throw new ValidationException(validationResult.Errors);
            }

            var product = await _productRepository.GetByIdAsync(id);

            if (product == null) { throw new KeyNotFoundException("Product not found!"); }

            _mapper.Map(dto, product);

            await _productRepository.UpdateAsync(product);

            await _productRepository.SaveChangesAsync();
        }
    }
}
