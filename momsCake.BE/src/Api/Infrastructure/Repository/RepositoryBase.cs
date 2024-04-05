using System.Linq.Expressions;
using Application.Common.Persistence;
using Domain.Common.Contracts;
using Infrastructure.Persistence.DbContext;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repository;

public class RepositoryBase<T>(ApplicationDbContext applicationDbContext) : IRepositoryBase<T>
    where T : BaseEntity
{
    protected ApplicationDbContext ApplicationDbContext { get; set; } = applicationDbContext;

    public IQueryable<T> FindAll() => ApplicationDbContext.Set<T>().AsNoTracking();

    public IQueryable<T> FindByCondition(Expression<Func<T, bool>> expression) =>
        ApplicationDbContext.Set<T>().Where(expression).AsNoTracking();

    public void Create(T entity) => ApplicationDbContext.Set<T>().Add(entity);

    public void Update(T entity) => ApplicationDbContext.Set<T>().Update(entity);

    public void Delete(T entity) => ApplicationDbContext.Set<T>().Remove(entity);
    public void SaveChanges() => ApplicationDbContext.SaveChanges();
}