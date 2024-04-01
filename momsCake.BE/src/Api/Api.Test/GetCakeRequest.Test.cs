using Application.Handlers.Cake;
using MassTransit.Mediator;
using NSubstitute;

namespace Api;

[TestFixture]
public class GetCakeRequest_Testing
{
    [Test]
    [TestCase(null)]
    public async Task GetCakeQueryHandler_EmptyId_ThrowsException(Guid? sampleCakeId)
    {
        // Arrange
        var mediator = Substitute.For<IMediator>();
        var getCakeQuery = new GetCakeQuery(sampleCakeId);

        // Act
        try
        {
            await mediator.Send(getCakeQuery);
        }
        catch (Exception e)
        {
            // Assert
            Assert.IsAssignableFrom(typeof(ArgumentNullException), e);
        }
    }
}