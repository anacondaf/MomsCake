using Domain.Enums;

namespace Domain.Models;

public class Cake: BaseEntity
{
    public decimal Price { get; set; }
    public CakeCategory Category { get; set; }
}