using Api.Enums;
using Domain.Common.Contracts;
using Domain.Models;

namespace Api.Domains;

public class Category: BaseEntity
{
    public CakeCategory Name { get; set; }
    public Guid CakeId { get; set; }
    
    // Navigation
    public virtual ICollection<Cake> Cakes { get; set; } = default!;
}