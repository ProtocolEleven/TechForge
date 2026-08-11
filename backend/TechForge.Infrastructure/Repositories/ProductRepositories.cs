using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechForge.Application.Common.Models;
using TechForge.Application.Interfaces.Persistance;
using TechForge.Domain.Entities;
using TechForge.Infrastructure.Data.Context;

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

        public async Task<(IEnumerable<Product> Products, int TotalCount)> GetProductsAsync(ProductQueryParameters parameters)
        {
            IQueryable<Product> query = _context.Products
                .Include(p => p.Category)
                .Include(p => p.Brand);

            if (!string.IsNullOrWhiteSpace(parameters.Search))
            {
                var search = parameters.Search.Trim();

                query = query.Where(x =>
                    x.Name.Contains(search) ||
                    x.SKU.Contains(search) ||
                    (x.Description != null && x.Description.Contains(search)));
            }

            var totalCount = await query.CountAsync();

            var products = await query
                .OrderBy(p => p.Id)
                .Skip((parameters.PageNumber - 1) * parameters.PageSize)
                .Take(parameters.PageSize)
                .ToListAsync();

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
