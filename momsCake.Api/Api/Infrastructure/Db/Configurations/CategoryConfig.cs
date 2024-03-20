using Api.Domains;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Api.Infrastructure.Db.Configurations;

public class CategoryConfig: IEntityTypeConfiguration<Category>
{
    public void Configure(EntityTypeBuilder<Category> builder)
    {
        builder
            .HasMany(cate => cate.Cakes)
            .WithOne(cake => cake.Category)
            .HasForeignKey(x => x.CategoryId);
    }
}