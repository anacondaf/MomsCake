using Application.Common.Persistence;
using MediatR;
using Microsoft.AspNetCore.Identity;

namespace Application.Handlers.Cake;

/// <summary>
/// A request handlers for GET /cake API
/// </summary>
/// <param name="id">Cake's id</param>
public class GetCakeQuery(Guid? id) : IRequest<List<Domain.Models.Cake>>
{
    public Guid? Id { get; set; } = id;
}

public class GetCakeQueryHandler : IRequestHandler<GetCakeQuery, List<Domain.Models.Cake>>
{
    private readonly UserManager<IdentityUser> _userManager;
    private readonly IRepositoryBase<Domain.Models.Cake> _repository;

    public GetCakeQueryHandler(UserManager<IdentityUser> userManager, IRepositoryBase<Domain.Models.Cake> repository)
    {
        _userManager = userManager;
        _repository = repository;
    }

    public Task<List<Domain.Models.Cake>> Handle(GetCakeQuery request, CancellationToken cancellationToken)
    {
        if (request.Id is null)
            throw new ArgumentNullException();

        var cakes = _repository.FindAll().ToList();

        return Task.FromResult(cakes);
    }
}