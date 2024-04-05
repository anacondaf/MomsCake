using System.ComponentModel;
using Domain.Enums;
using Domain.Models;
using Host.Extensions;

namespace Host.Middlewares;

public enum FileExtensionType
{
    [Description(".jpg")]
    Jpg,
    
    [Description(".png")]
    Png,
    
    [Description(".webp")]
    Webp
}

public class File
{
    public FileExtensionType Type { get; set; }
}

public class PipeProgrammingMiddleware: IMiddleware
{
    public Task InvokeAsync(HttpContext context, RequestDelegate next)
    {
        var file = new File();
        
        
        
        throw new NotImplementedException();
    }
}