namespace Api.Configurations;

public static class Startup
{
    public static IConfigurationBuilder AddJsonConfiguration(this IConfigurationBuilder configuration)
    {
        const string configurationDirectory = "Configurations";

        return configuration
            .AddJsonFile($"{configurationDirectory}/database.json", optional: false, reloadOnChange: true)
            .AddJsonFile($"{configurationDirectory}/benchmark.json", optional: false, reloadOnChange: true)
            .AddEnvironmentVariables();
    }
}