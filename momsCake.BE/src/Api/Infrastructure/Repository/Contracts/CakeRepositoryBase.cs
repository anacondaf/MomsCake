using Domain.Models;
using Infrastructure.Persistence.DbContext;

namespace Infrastructure.Repository.Contracts;

public class CakeRepositoryBase(ApplicationDbContext applicationDbContext) : RepositoryBase<Cake>(applicationDbContext), ICakeRepositoryBase
{
    
}