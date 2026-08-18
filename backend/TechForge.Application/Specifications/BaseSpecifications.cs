using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace TechForge.Application.Specifications
{
    public abstract class BaseSpecification<T> : ISpecification<T>
    {
        protected BaseSpecification()
        {
        }

        protected BaseSpecification(Expression<Func<T, bool>> criteria)
        {
            Criteria = criteria;
        }

        public Expression<Func<T, bool>>? Criteria
        {
            get;
        }

        public List<Expression<Func<T, object>>> Includes
        {
            get;
        } = [];

        public Expression<Func<T, object>>? OrderBy
        {
            private set;
            get;
        }

        public Expression<Func<T, object>>? OrderByDescending
        {
            private set;
            get;
        }

        public int Skip
        {
            private set;
            get;
        }

        public int Take
        {
            private set;
            get;
        }

        public bool IsPagingEnabled
        {
            private set;
            get;
        }

        protected void AddInclude(Expression<Func<T, object>> include)
        {
            Includes.Add(include);
        }

        protected void AddOrderBy(Expression<Func<T, object>> orderBy)
        {
            OrderBy = orderBy;
        }

        protected void AddOrderByDescending(Expression<Func<T, object>> orderByDescending)
        {
            OrderByDescending = orderByDescending;
        }

        protected void ApplyPaging(int skip, int take)
        {
            Skip = skip;

            Take = take;

            IsPagingEnabled = true;
        }
    }
}
