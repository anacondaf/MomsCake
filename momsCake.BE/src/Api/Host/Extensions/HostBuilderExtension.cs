using Application;
using Host.Configurations;
using Infrastructure;
using Infrastructure.Identity;
using Infrastructure.Persistence;

namespace Host.Extensions;

public static class HostBuilderExtension
{
    public static IServiceCollection HostBuilderService(this IServiceCollection service, IConfiguration configuration)
    {
        return
            service
                .AddIdentity()
                .AddPersistence(configuration)
                .AddApplication()
                .AddEndpointsApiExplorer()
                .AddSwaggerGen()
                .AddApplicationServices();
    }    
}