using System.Linq.Expressions;
using Domain.Common.Contracts;

namespace Application.Common.Persistence;

public interface IRepositoryBase<T> where T : BaseEntity
{
    IQueryable<T> FindAll();
    IQueryable<T> FindByCondition(Expression<Func<T, bool>> expression);
    void Create(T entity);
    void Update(T entity);
    void Delete(T entity);
    void SaveChanges();
}