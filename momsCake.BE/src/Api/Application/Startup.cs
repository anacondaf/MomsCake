using System.Reflection;
using Application.Common.Behaviours;
using MediatR;
using Microsoft.Extensions.DependencyInjection;

namespace Application;

public static class Startup
{
    public static IServiceCollection AddApplication(this IServiceCollection service)
    {
        var assembly = Assembly.GetExecutingAssembly();
        
        return service
            .AddMediatR(
            cfg =>
            {
                cfg.RegisterServicesFromAssembly(assembly);
            })
            .AddSingleton(typeof(IPipelineBehavior<,>), typeof(LoggingBehaviour<,>));
    }
}