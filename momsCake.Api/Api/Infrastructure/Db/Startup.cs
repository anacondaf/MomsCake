using Microsoft.EntityFrameworkCore;
using Pomelo.EntityFrameworkCore.MySql.Infrastructure;

namespace Api.Infrastructure.Db;

public static class Startup
{
    public static void AddPersistence(this IServiceCollection service, IConfiguration config)
    {
        var dbSettings = config.GetSection(nameof(DbSettings)).Get<DbSettings>();
        
        ArgumentNullException.ThrowIfNull(dbSettings);

        var mySqlServerVersion = new MySqlServerVersion(new Version(8, 0, 0));

        service.AddDbContext<ApplicationDbContext>(builder => 
            builder
                .UseMySql(dbSettings.ConnectionString, mySqlServerVersion, o => 
                o.SchemaBehavior(
                    MySqlSchemaBehavior.Translate, 
                    (schema, table) => $"{schema}_{table}")
                ));
    }
}