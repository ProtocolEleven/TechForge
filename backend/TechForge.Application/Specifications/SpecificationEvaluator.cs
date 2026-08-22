using Microsoft.EntityFrameworkCore;
using TechForge.Application.Specifications;

namespace TechForge.Infrastructure.Specifications;

public static class SpecificationEvaluator
{
    public static IQueryable<T> GetQuery<T>(
        IQueryable<T> inputQuery,
        ISpecification<T> specification,
        bool applyIncludes = true,
        bool applySorting = true,
        bool applyPaging = true)
        where T : class
    {
        IQueryable<T> query = inputQuery;

        foreach (var criteria in specification.Criteria)
        {
            query = query.Where(criteria);
        }

        if (applyIncludes)
        {
            query = specification.Includes.Aggregate(
                query,
                (current, include) => current.Include(include));
        }

        if (applySorting)
        {
            if (specification.OrderBy is not null)
            {
                query = query.OrderBy(specification.OrderBy);
            }
            else if (specification.OrderByDescending is not null)
            {
                query = query.OrderByDescending(
                    specification.OrderByDescending);
            }
        }

        if (applyPaging && specification.IsPagingEnabled)
        {
            query = query
                .Skip(specification.Skip)
                .Take(specification.Take);
        }

        return query;
    }
}