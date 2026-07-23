using AutoMapper;
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

        public ProductService(IProductRepository productRepository, IMapper mapper)
        {
            _productRepository = productRepository; 
            _mapper = mapper;
        }

        public async Task<int> CreateAsync(CreateProductDto dto)
        {
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
            var product = await _productRepository.GetByIdAsync(id);

            if (product == null) { throw new KeyNotFoundException("Product not found!"); }

            _mapper.Map(dto, product);

            await _productRepository.UpdateAsync(product);

            await _productRepository.SaveChangesAsync();
        }
    }
}
