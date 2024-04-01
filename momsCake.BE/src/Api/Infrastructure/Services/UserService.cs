using Application.Interfaces;

namespace Infrastructure.Services;

public class UserService: IUserService
{
    public string PrintFixedUserName()
    {
        return "Kai Nguyen";
    }

    public int Calculate(int a, int b)
    {
        return a + b;
    }
}