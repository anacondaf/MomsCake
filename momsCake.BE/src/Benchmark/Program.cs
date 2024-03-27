using Microsoft.Extensions.Hosting;

namespace Benchmark;

class Program
{
    static void Main(string[] args)
    {
        var host = Host.CreateDefaultBuilder(args)
            .ConfigureServices(services =>
            {
            })
            .Build();
    }
}