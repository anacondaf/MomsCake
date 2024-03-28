using Application.Handlers.Cake.Dtos;
using MediatR;

namespace Application.Handlers.Cake;

/// <summary>
/// A request handlers for GET /cake API
/// </summary>
/// <param name="id">Cake's id</param>
public class GetCakeQuery(Guid id) : IRequest<CakeDto>
{
    public Guid Id { get; set; } = id;
}

public class GetCakeQueryHandler : IRequestHandler<GetCakeQuery, CakeDto>
{
    public Task<CakeDto> Handle(GetCakeQuery request, CancellationToken cancellationToken)
    {
        return Task.FromResult(new CakeDto());
    }
}