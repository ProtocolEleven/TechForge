using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechForge.Application.Common.Models;
using TechForge.Application.Interfaces.Persistance;
using TechForge.Application.Specifications.Products;
using TechForge.Domain.Entities;
using TechForge.Infrastructure.Data.Context;
using TechForge.Infrastructure.Specifications;

namespace TechForge.Infrastructure.Repositories
{
    public class ProductRepositories : IProductRepository
    {
        private readonly ApplicationDbContext _context;

        public ProductRepositories(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task AddAsync(Product product)
        {
            await _context.Products.AddAsync(product);
        }

        public Task DeleteAsync(Product product)
        {
            _context.Products.Remove(product);

            return Task.CompletedTask;
        }

        public async Task<bool> ExistsAsync(int id)
        {
            return await _context.Products
                .AnyAsync(x => x.Id == id);
        }

        public async Task<bool> ExistsBySkuAsync(string sku)
        {
            return await _context.Products
                .AnyAsync(p => p.SKU == sku);
        }

        public async Task<IEnumerable<Product>> GetAllAsync()
        {
            return await _context.Products
                .Include(p => p.Brand)
                .Include(p => p.Category)
                .AsNoTracking()
                .OrderBy(p => p.Name)
                .ToListAsync();
        }

        public async Task<Product?> GetByIdAsync(int id)
        {
            return await _context.Products
                .Include(p => p.Brand)
                .Include(p => p.Category)
                .AsNoTracking()
                .FirstOrDefaultAsync(p => p.Id == id);
        }

        public async Task<Product?> GetBySkuAsync(string sku)
        {
            return await _context.Products
                .FirstOrDefaultAsync(p => p.SKU == sku);
        }

        public async Task<(IEnumerable<Product> Products, int TotalCount)>GetProductsAsync(ProductQueryParameters parameters)
        {
            var specification = new ProductSpecification(parameters);

            var countQuery = SpecificationEvaluator.GetQuery(
                _context.Products.AsQueryable(),
                specification,
                applyPaging: false);

            var totalCount = await countQuery.CountAsync();

            var productsQuery = SpecificationEvaluator.GetQuery(
                _context.Products.AsQueryable(),
                specification);

            var products = await productsQuery.ToListAsync();

            return (products, totalCount);
        }

        public async Task SaveChangesAsync()
        {
            await _context.SaveChangesAsync();
        }

        public Task UpdateAsync(Product product)
        {
            _context.Products.Update(product);

            return Task.CompletedTask;
        }
    }
}
