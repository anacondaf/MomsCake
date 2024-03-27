using Api.Domains;
using Domain.Common.Contracts;

namespace Domain.Models;

public class Cake: BaseEntity
{
    public decimal Price { get; set; }
    
    // FK
    public Guid CategoryId { get; set; }
    
    // Navigation property
    public Category Category { get; set; }
}