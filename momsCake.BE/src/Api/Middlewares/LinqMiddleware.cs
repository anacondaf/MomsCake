namespace Api.Middlewares;

public class LinqMiddleware(RequestDelegate next)
{
    public async Task InvokeAsync(HttpContext context)
    {
        await context.Response.WriteAsync("Hello");
        await next(context);
    }
}

public static class LinqMiddlewareExecution
{
    public static IApplicationBuilder UseLinqMiddleware(this IApplicationBuilder app)
    => app.UseMiddleware<LinqMiddleware>();
}