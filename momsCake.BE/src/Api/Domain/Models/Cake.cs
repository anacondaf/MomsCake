namespace Domain.Models;

public class Cake: BaseEntity
{
    public decimal Price { get; set; }
    
    // FK
    public DefaultIdType CategoryId { get; set; }
    
    // Navigation property
    public Category Category { get; set; }
}