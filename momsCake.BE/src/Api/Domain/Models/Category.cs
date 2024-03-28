using Api.Enums;

namespace Domain.Models;

public class Category: BaseEntity
{
    public CakeCategory Name { get; set; }
    public DefaultIdType CakeId { get; set; }
    
    // Navigation
    public virtual ICollection<Cake> Cakes { get; set; } = default!;
}