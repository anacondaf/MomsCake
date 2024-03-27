using MassTransit;

namespace Domain.Common.Contracts;

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