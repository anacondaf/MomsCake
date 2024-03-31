using Application.Interfaces;

namespace Infrastructure.Services;

public class UserService: IUserService
{
    public string PrintFixedUserName()
    {
        return "Kai Nguyen";
    }
}