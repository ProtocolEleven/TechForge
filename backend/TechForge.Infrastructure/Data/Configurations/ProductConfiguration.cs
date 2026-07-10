using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechForge.Domain.Entities;

namespace TechForge.Infrastructure.Data.Configurations
{
    public class ProductConfiguration : IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Product> builder)
        {
            builder.ToTable("Products");

            builder.HasKey(x => x.Id);

            builder.Property(x => x.Name)
                   .HasMaxLength(200)
                   .IsRequired();

            builder.Property(x => x.SKU)
                   .HasMaxLength(50)
                   .IsRequired();

            builder.HasIndex(x => x.SKU)
                   .IsUnique();

            builder.Property(x => x.Description)
                   .HasMaxLength(2000);

            builder.Property(x => x.Price)
                   .HasColumnType("decimal(18,2)")
                   .IsRequired();

            builder.Property(x => x.StockQuantity)
                   .HasDefaultValue(0);

            builder.Property(x => x.IsActive)
                   .HasDefaultValue(true);

            builder.HasOne(x => x.Category)
                   .WithMany(x => x.Products)
                   .HasForeignKey(x => x.CategoryId)
                   .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.Brand)
                   .WithMany(x => x.Products)
                   .HasForeignKey(x => x.BrandId)
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
