using AutoMapper;
using FluentValidation;
using FluentValidation.Results;
using Moq;
using TechForge.Application.Common.Models;
using TechForge.Application.DTOs;
using TechForge.Application.Interfaces.Persistance;
using TechForge.Application.Services;
using TechForge.Domain.Entities;

namespace TechForge.Tests.Services;

public class ProductServiceTests
{
    private readonly Mock<IProductRepository> _productRepositoryMock;
    private readonly Mock<IMapper> _mapperMock;
    private readonly Mock<IValidator<CreateProductDto>> _createValidatorMock;
    private readonly Mock<IValidator<UpdateProductDto>> _updateValidatorMock;

    private readonly ProductService _productService;

    public ProductServiceTests()
    {
        _productRepositoryMock = new Mock<IProductRepository>();
        _mapperMock = new Mock<IMapper>();
        _createValidatorMock = new Mock<IValidator<CreateProductDto>>();
        _updateValidatorMock = new Mock<IValidator<UpdateProductDto>>();

        _productService = new ProductService(
            _productRepositoryMock.Object,
            _mapperMock.Object,
            _createValidatorMock.Object,
            _updateValidatorMock.Object);
    }

    [Fact]
    public async Task CreateAsync_ShouldCreateProduct_WhenRequestIsValidAndSkuDoesNotExist()
    {

        var dto = new CreateProductDto
        {
            Name = "RTX Graphics Card",
            SKU = "RTX-4090-001",
            Description = "High performance graphics card",
            Price = 1999.99m,
            StockQuantity = 10,
            BrandId = 1,
            CategoryId = 1
        };

        var product = new Product
        {
            Id = 1,
            Name = dto.Name,
            SKU = dto.SKU,
            Description = dto.Description,
            Price = dto.Price,
            StockQuantity = dto.StockQuantity,
            BrandId = dto.BrandId,
            CategoryId = dto.CategoryId
        };

        _createValidatorMock
            .Setup(x => x.ValidateAsync(
                dto,
                It.IsAny<CancellationToken>()))
            .ReturnsAsync(new ValidationResult());

        _productRepositoryMock
            .Setup(x => x.ExistsBySkuAsync(dto.SKU))
            .ReturnsAsync(false);

        _mapperMock
            .Setup(x => x.Map<Product>(dto))
            .Returns(product);


        var result = await _productService.CreateAsync(dto);


        Assert.Equal(product.Id, result);

        _createValidatorMock.Verify(
            x => x.ValidateAsync(
                dto,
                It.IsAny<CancellationToken>()),
            Times.Once);

        _productRepositoryMock.Verify(
            x => x.ExistsBySkuAsync(dto.SKU),
            Times.Once);

        _mapperMock.Verify(
            x => x.Map<Product>(dto),
            Times.Once);

        _productRepositoryMock.Verify(
            x => x.AddAsync(product),
            Times.Once);

        _productRepositoryMock.Verify(
            x => x.SaveChangesAsync(),
            Times.Once);
    }

    [Fact]
    public async Task CreateAsync_ShouldThrowValidationException_WhenRequestIsInvalid()
    {

        var dto = new CreateProductDto
        {
            Name = "",
            SKU = "",
            Price = -10
        };

        var validationFailures = new List<ValidationFailure>
        {
            new("Name", "Name is required."),
            new("SKU", "SKU is required.")
        };

        var validationResult =
            new ValidationResult(validationFailures);

        _createValidatorMock
            .Setup(x => x.ValidateAsync(
                dto,
                It.IsAny<CancellationToken>()))
            .ReturnsAsync(validationResult);


        await Assert.ThrowsAsync<ValidationException>(
            () => _productService.CreateAsync(dto));

        _productRepositoryMock.Verify(
            x => x.ExistsBySkuAsync(It.IsAny<string>()),
            Times.Never);

        _mapperMock.Verify(
            x => x.Map<Product>(It.IsAny<CreateProductDto>()),
            Times.Never);

        _productRepositoryMock.Verify(
            x => x.AddAsync(It.IsAny<Product>()),
            Times.Never);

        _productRepositoryMock.Verify(
            x => x.SaveChangesAsync(),
            Times.Never);
    }

    [Fact]
    public async Task CreateAsync_ShouldThrowInvalidOperationException_WhenSkuAlreadyExists()
    {

        var dto = new CreateProductDto
        {
            Name = "Test Product",
            SKU = "EXISTING-SKU",
            Description = "Test Description",
            Price = 100,
            StockQuantity = 5,
            BrandId = 1,
            CategoryId = 1
        };

        _createValidatorMock
            .Setup(x => x.ValidateAsync(
                dto,
                It.IsAny<CancellationToken>()))
            .ReturnsAsync(new ValidationResult());

        _productRepositoryMock
            .Setup(x => x.ExistsBySkuAsync(dto.SKU))
            .ReturnsAsync(true);

        var exception =
            await Assert.ThrowsAsync<InvalidOperationException>(
                () => _productService.CreateAsync(dto));

        Assert.Equal(
            "SKU already exists!",
            exception.Message);

        _mapperMock.Verify(
            x => x.Map<Product>(It.IsAny<CreateProductDto>()),
            Times.Never);

        _productRepositoryMock.Verify(
            x => x.AddAsync(It.IsAny<Product>()),
            Times.Never);

        _productRepositoryMock.Verify(
            x => x.SaveChangesAsync(),
            Times.Never);
    }

    [Fact]
    public async Task GetProductByIdAsync_ShouldReturnProductDto_WhenProductExists()
    {

        var product = new Product
        {
            Id = 1,
            Name = "Test Product",
            SKU = "TEST-001",
            Description = "Test Description",
            Price = 100,
            StockQuantity = 10,
            BrandId = 1,
            CategoryId = 1
        };

        var productDto = new ProductDto
        {
            Id = product.Id,
            Name = product.Name,
            Price = product.Price,
            Brand = "Test Brand",
            Category = "Test Category"
        };

        _productRepositoryMock
            .Setup(x => x.GetByIdAsync(product.Id))
            .ReturnsAsync(product);

        _mapperMock
            .Setup(x => x.Map<ProductDto>(product))
            .Returns(productDto);

        var result =
            await _productService.GetProductByIdAsync(product.Id);

        Assert.NotNull(result);
        Assert.Equal(productDto.Id, result.Id);
        Assert.Equal(productDto.Name, result.Name);
        Assert.Equal(productDto.Price, result.Price);

        _productRepositoryMock.Verify(
            x => x.GetByIdAsync(product.Id),
            Times.Once);

        _mapperMock.Verify(
            x => x.Map<ProductDto>(product),
            Times.Once);
    }

    [Fact]
    public async Task GetProductByIdAsync_ShouldReturnNull_WhenProductDoesNotExist()
    {

        const int productId = 999;

        _productRepositoryMock
            .Setup(x => x.GetByIdAsync(productId))
            .ReturnsAsync((Product?)null);

        var result =
            await _productService.GetProductByIdAsync(productId);

        Assert.Null(result);

        _mapperMock.Verify(
            x => x.Map<ProductDto>(It.IsAny<Product>()),
            Times.Never);
    }

    [Fact]
    public async Task UpdateAsync_ShouldUpdateProduct_WhenRequestIsValidAndProductExists()
    {

        const int productId = 1;

        var dto = new UpdateProductDto
        {
            Name = "Updated Product",
            SKU = "UPDATED-001",
            Description = "Updated Description",
            Price = 250,
            StockQuantity = 20,
            BrandId = 1,
            CategoryId = 1
        };

        var product = new Product
        {
            Id = productId,
            Name = "Old Product",
            SKU = "OLD-001",
            Price = 100
        };

        _updateValidatorMock
            .Setup(x => x.ValidateAsync(
                dto,
                It.IsAny<CancellationToken>()))
            .ReturnsAsync(new ValidationResult());

        _productRepositoryMock
            .Setup(x => x.GetByIdAsync(productId))
            .ReturnsAsync(product);

        await _productService.UpdateAsync(productId, dto);

        _updateValidatorMock.Verify(
            x => x.ValidateAsync(
                dto,
                It.IsAny<CancellationToken>()),
            Times.Once);

        _productRepositoryMock.Verify(
            x => x.GetByIdAsync(productId),
            Times.Once);

        _mapperMock.Verify(
            x => x.Map(dto, product),
            Times.Once);

        _productRepositoryMock.Verify(
            x => x.UpdateAsync(product),
            Times.Once);

        _productRepositoryMock.Verify(
            x => x.SaveChangesAsync(),
            Times.Once);
    }

    [Fact]
    public async Task UpdateAsync_ShouldThrowKeyNotFoundException_WhenProductDoesNotExist()
    {

        const int productId = 999;

        var dto = new UpdateProductDto
        {
            Name = "Updated Product",
            SKU = "UPDATED-001",
            Price = 100,
            StockQuantity = 10,
            BrandId = 1,
            CategoryId = 1
        };

        _updateValidatorMock
            .Setup(x => x.ValidateAsync(
                dto,
                It.IsAny<CancellationToken>()))
            .ReturnsAsync(new ValidationResult());

        _productRepositoryMock
            .Setup(x => x.GetByIdAsync(productId))
            .ReturnsAsync((Product?)null);

        var exception =
            await Assert.ThrowsAsync<KeyNotFoundException>(
                () => _productService.UpdateAsync(productId, dto));

        Assert.Equal(
            "Product not found!",
            exception.Message);

        _mapperMock.Verify(
            x => x.Map(
                It.IsAny<UpdateProductDto>(),
                It.IsAny<Product>()),
            Times.Never);

        _productRepositoryMock.Verify(
            x => x.UpdateAsync(It.IsAny<Product>()),
            Times.Never);

        _productRepositoryMock.Verify(
            x => x.SaveChangesAsync(),
            Times.Never);
    }

    [Fact]
    public async Task DeleteAsync_ShouldDeleteProduct_WhenProductExists()
    {

        var product = new Product
        {
            Id = 1,
            Name = "Test Product",
            SKU = "TEST-001",
            Price = 100
        };

        _productRepositoryMock
            .Setup(x => x.GetByIdAsync(product.Id))
            .ReturnsAsync(product);

        await _productService.DeleteAsync(product.Id);

        _productRepositoryMock.Verify(
            x => x.GetByIdAsync(product.Id),
            Times.Once);

        _productRepositoryMock.Verify(
            x => x.DeleteAsync(product),
            Times.Once);

        _productRepositoryMock.Verify(
            x => x.SaveChangesAsync(),
            Times.Once);
    }

    [Fact]
    public async Task DeleteAsync_ShouldThrowKeyNotFoundException_WhenProductDoesNotExist()
    { 

        const int productId = 999;

        _productRepositoryMock
            .Setup(x => x.GetByIdAsync(productId))
            .ReturnsAsync((Product?)null);

        var exception =
            await Assert.ThrowsAsync<KeyNotFoundException>(
                () => _productService.DeleteAsync(productId));

        Assert.Equal(
            "Product not found!",
            exception.Message);

        _productRepositoryMock.Verify(
            x => x.DeleteAsync(It.IsAny<Product>()),
            Times.Never);

        _productRepositoryMock.Verify(
            x => x.SaveChangesAsync(),
            Times.Never);
    }
}