using Application.Handlers.Cake;
using Application.Handlers.Cake.Dtos;
using Application.Interfaces;
using Domain.Models;
using Microsoft.AspNetCore.Mvc;

namespace Host.Controllers;

public class CakeController : BaseApiController
{
    private readonly IUserService _userService;

    public CakeController(IUserService userService)
    {
        _userService = userService;
    }

    [HttpGet]
    [Route("")]
    public ActionResult<string> GetUserName()
    {
        return Ok(_userService.PrintFixedUserName());
    }

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