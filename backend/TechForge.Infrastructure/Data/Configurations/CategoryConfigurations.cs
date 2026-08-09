using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechForge.Domain.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TechForge.Infrastructure.Data.Configurations
{
    public class CategoryConfigurations : IEntityTypeConfiguration<Category>
    {
        public void Configure(EntityTypeBuilder<Category> builder)
        {
            builder.ToTable("Category");

            builder.HasKey(c => c.Id);

            builder.Property(c => c.Name)
                    .HasMaxLength(100)
                    .IsRequired();

            builder.HasIndex(c => c.Name)
                    .IsUnique();

            builder.Property(c => c.Description)
                    .HasMaxLength(500);

            builder.Property(c => c.IsActive)
                    .HasDefaultValue(true);

            builder.Property(x => x.CreatedAt)
                    .HasDefaultValueSql("SYSUTCDATETIME()");

            builder.Property(x => x.UpdatedAt)
                   .IsRequired(false);

            builder.HasMany(c => c.Products)
                    .WithOne(c => c.Category)
                    .HasForeignKey(c => c.CategoryId)
                    .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
