using Host.Middlewares;

namespace Host.Extensions;

public static class PipeExtensions
{
    public static TOut Pipe<TIn, TOut>(this TIn input, Func<TIn, TOut> fn)
    {
        return fn(input);
    }
}