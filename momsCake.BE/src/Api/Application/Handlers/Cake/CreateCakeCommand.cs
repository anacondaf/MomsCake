using Application.Common.Persistence;
using Domain.Attributes;
using Domain.Enums;
using MediatR;

namespace Application.Handlers.Cake;

public class CreateCakeCommand: IRequest<Guid>
{
    public double Price { get; set; }
    
    [OpenApiEnum(typeof(CakeCategory))]
    public CakeCategory Category { get; set; }
}

public class CreateCakeCommandHandlers : IRequestHandler<CreateCakeCommand, Guid>
{
    private readonly IRepositoryBase<Domain.Models.Cake> _repository;

    public CreateCakeCommandHandlers(IRepositoryBase<Domain.Models.Cake> repository)
    {
        _repository = repository;
    }

    public async Task<Guid> Handle(CreateCakeCommand request, CancellationToken cancellationToken)
    {
        var cake = new Domain.Models.Cake()
        {
            Price = (decimal)request.Price,
            Category = request.Category,
        };
        
        _repository.Create(cake);
        _repository.SaveChanges();

        return cake.Id;
    }
}