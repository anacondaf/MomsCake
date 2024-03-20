using BenchmarkDotNet.Running;

namespace Api.Benchmark;

public static class Startup
{
    public static void StartBenchmarking(this IApplicationBuilder app, IConfiguration config)
    {
        var benchmarkSettings = config.GetSection(nameof(BenchmarkSettings)).Get<BenchmarkSettings>();

        if (benchmarkSettings is { NeedBenchmark: false })
        {
            return;
        }
        
        BenchmarkRunner.Run(typeof(Startup).Assembly);
    }
}