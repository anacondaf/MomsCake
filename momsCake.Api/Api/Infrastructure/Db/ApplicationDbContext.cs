using System.Reflection;
using Api.Domains;
using Microsoft.EntityFrameworkCore;

namespace Api.Infrastructure.Db;

public class ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : DbContext(options)
{
    public DbSet<Cake> Cakes => Set<Cake>();
    public DbSet<Category> Categories => Set<Category>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {   
        base.OnModelCreating(modelBuilder);
        
        modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly().GetType().Assembly);
    }
}