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
    public class BrandConfiguration : IEntityTypeConfiguration<Brand>
    {
        public void Configure(EntityTypeBuilder<Brand> builder)
        {
            builder.ToTable("Brands");

            builder.HasKey(x => x.Id);

            builder.Property(x => x.Name)
                    .HasMaxLength(100)
                    .IsRequired();

            builder.Property(x => x.Description)
                    .HasMaxLength(500);

            builder.Property(x => x.LogoUrl)
                    .HasMaxLength (500);

            builder.Property(x => x.IsActive)
                    .HasDefaultValue(true);

            builder.HasMany(x => x.Products)
                    .WithOne(x => x.Brand)
                    .HasForeignKey(x => x.BrandId)
                    .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
