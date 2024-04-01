namespace Application.Interfaces;

public interface IUserService: ITransientService
{
    string PrintFixedUserName();
    int Calculate(int a, int b);
}