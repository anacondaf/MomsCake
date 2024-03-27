using Api.Infrastructure.Db;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Pomelo.EntityFrameworkCore.MySql.Infrastructure;

namespace Infrastructure.Persistence;

public static class Startup
{
    public static void AddPersistence(this IServiceCollection service, IConfiguration config)
    {
        var dbSettings = config.GetSection(nameof(DbSettings)).Get<DbSettings>();

        ArgumentNullException.ThrowIfNull(dbSettings);

        var mySqlServerVersion = new MySqlServerVersion(new Version(8, 0, 0));

        service.AddDbContext<ApplicationDbContext>(builder => 
            builder
                .UseMySql(
                    dbSettings.ConnectionString,
                    mySqlServerVersion, 
                    o => o.MigrationsAssembly("Migrators.MySQL")
                    .SchemaBehavior(MySqlSchemaBehavior.Translate, (schema, table) => $"{schema}_{table}")
                ));
    }
}