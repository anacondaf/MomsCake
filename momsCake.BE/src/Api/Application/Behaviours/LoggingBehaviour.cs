using MediatR;
using Microsoft.Extensions.Logging;

namespace Application.Behaviours;

public class LoggingBehaviour<TRequest, TResponse>(ILogger<LoggingBehaviour<TRequest, TResponse>> logger)
    : IPipelineBehavior<TRequest, TResponse>
    where TRequest : IRequest<TResponse>
{
    public async Task<TResponse> Handle(TRequest request, RequestHandlerDelegate<TResponse> next, CancellationToken cancellationToken)
    {
        logger.LogInformation($"Handling {typeof(TRequest).Name}");
        var response = await next();

        logger.LogInformation($"Handled {typeof(TResponse).Name}");
        return response;
    }
}