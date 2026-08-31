using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TechForge.Application.Common.Models;
using TechForge.Application.DTOs;
using TechForge.Application.Services.Interfaces;
using TechForge.Domain.Constants;

namespace TechForge.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ProductController : ControllerBase
    {
        private readonly IProductService _productService;

        public ProductController(IProductService productService)
        {
            _productService = productService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProductDto>>> GetAllProducts([FromQuery] ProductQueryParameters parameters)
        {
            var products = await _productService.GetProductsAsync(parameters);

            return Ok(products);
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<ProductDto>> GetById(int id)
        {
            var product = await _productService.GetProductByIdAsync(id);

            if (product == null) { return NotFound(); }

            return Ok(product);
        }

        [HttpPost]
        [Authorize(Roles = UserRoles.Admin)]
        public async Task<ActionResult> CreateProduct(CreateProductDto dto)
        {
            var id = await _productService.CreateAsync(dto);

            return CreatedAtAction(
                nameof(GetById),
                new { id },
                null);
        }

        [HttpPut("{id:int}")]
        [Authorize(Roles = UserRoles.Admin)]
        public async Task<IActionResult> UpdateProduct(int id, UpdateProductDto dto)
        {
            await _productService.UpdateAsync(id, dto);

            return NoContent();
        }

        [HttpDelete("{id:int}")]
        [Authorize(Roles = UserRoles.Admin)]
        public async Task<IActionResult> DeleteProduct(int id)
        {
            await _productService.DeleteAsync(id);
            return NoContent();
        }
    }
}
