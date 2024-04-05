using Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Persistence.DbContext;

public class ApplicationDbContext : BaseDbContext
{
    public ApplicationDbContext(DbContextOptions options) : base(options)
    {
    }
    
    public DbSet<Cake> Cakes => Set<Cake>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        modelBuilder.ApplyConfigurationsFromAssembly(GetType().Assembly);
    }
}