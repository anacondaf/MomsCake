```

BenchmarkDotNet v0.13.12, Fedora Linux 38 (Workstation Edition)
AMD Ryzen 9 6900HS Creator Edition, 1 CPU, 16 logical and 8 physical cores
.NET SDK 8.0.102
  [Host]     : .NET 8.0.2 (8.0.224.6711), X64 RyuJIT AVX2
  DefaultJob : .NET 8.0.2 (8.0.224.6711), X64 RyuJIT AVX2


```
| Method          | Mean      | Error     | StdDev    | Median    | Allocated |
|---------------- |----------:|----------:|----------:|----------:|----------:|
| LinqLazyLoading | 0.0105 ns | 0.0096 ns | 0.0090 ns | 0.0132 ns |         - |
