using Application.Handlers.Cake.Dtos;
using MediatR;
using Microsoft.AspNetCore.Identity;

namespace Application.Handlers.Cake;

/// <summary>
/// A request handlers for GET /cake API
/// </summary>
/// <param name="id">Cake's id</param>
public class GetCakeQuery(Guid? id) : IRequest<CakeDto>
{
    public Guid? Id { get; set; } = id;
}

public class GetCakeQueryHandler : IRequestHandler<GetCakeQuery, CakeDto>
{
    private readonly UserManager<IdentityUser> _userManager;

    public GetCakeQueryHandler(UserManager<IdentityUser> userManager)
    {
        _userManager = userManager;
    }

    public Task<CakeDto> Handle(GetCakeQuery request, CancellationToken cancellationToken)
    {
        if (request.Id is null)
            throw new ArgumentNullException();

        return Task.FromResult(new CakeDto());
    }
}