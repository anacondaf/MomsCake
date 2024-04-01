using Application.Interfaces;
using Infrastructure.Services;

namespace Api;

[TestFixture]
public class Tests
{
    [SetUp]
    public void Init()
    {
        Console.WriteLine("Init...");
    }

    [Test]
    public void PrintFixedUserName_ConstantUserName_ReturnTrueIfEqual()
    {
        // Arrange
        IUserService userService = new UserService();

        // Act
        var userName = userService.PrintFixedUserName();

        // Assert
        Assert.That(userName, Is.EqualTo("Kai Nguyen").IgnoreCase);
    }

    [Test]
    [TestCase(1, 2, ExpectedResult = 3)]
    [TestCase(5, 5, ExpectedResult = 10)]
    public int Calculate_InputTwoStringParams_ShouldThrowException(int a, int b)
    {
        // Arrange
        IUserService userService = new UserService();

        // Act
        return userService.Calculate(a, b);
    }
}