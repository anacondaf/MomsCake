namespace Application.Interfaces;

public interface IUserService: ITransientService
{
    string PrintFixedUserName();
}