using TechForge.Application.Common.Models;
using TechForge.Domain.Entities;

namespace TechForge.Application.Specifications.Products;

public class ProductSpecification : BaseSpecification<Product>
{
    public ProductSpecification(ProductQueryParameters parameters)
    {
        AddInclude(x => x.Brand);
        AddInclude(x => x.Category);

        ApplySearch(parameters);
        ApplyFilters(parameters);
        ApplySorting(parameters);
        ApplyPagination(parameters);
    }

    private void ApplySearch(ProductQueryParameters parameters)
    {
        if (string.IsNullOrWhiteSpace(parameters.Search))
        {
            return;
        }

        var search = parameters.Search.Trim();

        AddCriteria(x =>
            x.Name.Contains(search) ||
            x.SKU.Contains(search) ||
            (x.Description != null &&
             x.Description.Contains(search)));
    }

    private void ApplyFilters(ProductQueryParameters parameters)
    {
        if (parameters.CategoryId.HasValue)
        {
            AddCriteria(x =>
                x.CategoryId == parameters.CategoryId.Value);
        }

        if (parameters.BrandId.HasValue)
        {
            AddCriteria(x =>
                x.BrandId == parameters.BrandId.Value);
        }
    }

    private void ApplySorting(ProductQueryParameters parameters)
    {
        var sortBy = parameters.SortBy?.Trim().ToLowerInvariant();

        var descending = string.Equals(
            parameters.SortDirection,
            "desc",
            StringComparison.OrdinalIgnoreCase);

        switch (sortBy)
        {
            case "name":
                if (descending)
                {
                    AddOrderByDescending(x => x.Name);
                }
                else
                {
                    AddOrderBy(x => x.Name);
                }

                break;

            case "price":
                if (descending)
                {
                    AddOrderByDescending(x => x.Price);
                }
                else
                {
                    AddOrderBy(x => x.Price);
                }

                break;

            case "createdat":
                if (descending)
                {
                    AddOrderByDescending(x => x.CreatedAt);
                }
                else
                {
                    AddOrderBy(x => x.CreatedAt);
                }

                break;

            default:
                AddOrderBy(x => x.Id);
                break;
        }
    }

    private void ApplyPagination(ProductQueryParameters parameters)
    {
        var skip =
            (parameters.PageNumber - 1) * parameters.PageSize;

        ApplyPaging(skip, parameters.PageSize);
    }
}