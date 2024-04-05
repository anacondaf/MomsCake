using Infrastructure.Common;
using Infrastructure.Repository;
using Microsoft.Extensions.DependencyInjection;

namespace Infrastructure;

public static class Startup
{
    public static IServiceCollection AddApplicationServices(this IServiceCollection service)
        => service.AddServices().AddRepository();
}