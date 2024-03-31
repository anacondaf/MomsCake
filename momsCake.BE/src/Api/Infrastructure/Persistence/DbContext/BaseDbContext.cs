using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Persistence.DbContext;

public class BaseDbContext : IdentityDbContext
{
    public BaseDbContext(DbContextOptions options)
        : base(options)
    {

    }
}