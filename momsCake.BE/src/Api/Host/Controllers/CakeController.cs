using Application.Handlers.Cake;
using Application.Handlers.Cake.Dtos;
using Domain.Models;
using Microsoft.AspNetCore.Mvc;

namespace Host.Controllers;

public class CakeController : BaseApiController
{
    [HttpGet]
    [Route("test/{randNum:guid}")]
    public ActionResult<List<Cake>> Test(Guid randNum)
    {
        return Ok(new List<Cake>()
        {
            new Cake()
            {
                Price = 1.0m,
            },
            new Cake()
            {
                Price = 1.0m,
            },
            new Cake()
            {
                Price = 1.0m,
            },
        });
    }

    [HttpGet("{id:guid}")]
    public async Task<CakeDto> GetCakeAsync(Guid id)
    {
        return await Mediator.Send(new GetCakeQuery(id));
    }
}