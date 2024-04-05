using Application.Common.Persistence;
using Microsoft.Extensions.DependencyInjection;

namespace Infrastructure.Repository;

public static class Startup
{
    public static IServiceCollection AddRepository(this IServiceCollection service)
    {
        return service.AddScoped(typeof(IRepositoryBase<>), typeof(RepositoryBase<>));
    }
}