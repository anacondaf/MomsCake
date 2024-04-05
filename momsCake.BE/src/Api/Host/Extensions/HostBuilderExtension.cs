using Application;
using Domain.Attributes;
using Host.Configurations;
using Infrastructure;
using Infrastructure.Identity;
using Infrastructure.Persistence;
using Microsoft.OpenApi.Any;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace Host.Extensions;

//// <summary>
/// Applies the enum property to an OpenAPI schema. Most useful to constrain
/// strings to be a specific value.
/// </summary>
public class OpenApiEnumSchemaFilter : ISchemaFilter
{
    public void Apply(OpenApiSchema schema, SchemaFilterContext context)
    {
        if (context.MemberInfo == null)
        {
            return;
        }
        var enumAnnotation = context.MemberInfo.GetCustomAttributes(typeof(OpenApiEnumAttribute), false)
            .Cast<OpenApiEnumAttribute>()
            .FirstOrDefault();

        if (enumAnnotation == null) return;

        schema.Enum = enumAnnotation.EnumOptions.Select(option => new OpenApiString(option))
            .Cast<IOpenApiAny>().ToList();
    }
}

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