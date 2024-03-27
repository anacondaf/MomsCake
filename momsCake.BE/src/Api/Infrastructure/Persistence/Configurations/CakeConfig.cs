using Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Infrastructure.Persistence.Configurations;

public class CakeConfig: IEntityTypeConfiguration<Cake>
{
    public void Configure(EntityTypeBuilder<Cake> builder)
    {
        builder
            .HasOne(c => c.Category)
            .WithMany(cate => cate.Cakes)
            .HasForeignKey(c => c.CategoryId);
    }
}