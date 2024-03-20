using MassTransit;

namespace Api.Domains.Contracts;

public class BaseEntity : BaseEntity<DefaultIdType>
{
    protected BaseEntity()
    {
        Id = Id == default ? NewId.NextGuid() : Id;
    }
}

public class BaseEntity<TId>
{
    public TId Id { get; set; } = default!;
}