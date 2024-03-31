using Infrastructure.Common;
using Microsoft.Extensions.DependencyInjection;

namespace Infrastructure;

public static class Startup
{
    public static IServiceCollection AddApplicationServices(this IServiceCollection service)
    => service.AddServices();
}