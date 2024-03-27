using BenchmarkDotNet.Attributes;

namespace Api.Benchmark;

[MemoryDiagnoser]
public class BenchmarkLinqPerformance
{
    [Benchmark]
    public void LinqLazyLoading()
    {
        
    }
}