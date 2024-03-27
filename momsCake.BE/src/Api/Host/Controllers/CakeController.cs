using Api.Controllers;
using Domain.Models;
using Microsoft.AspNetCore.Mvc;

namespace Host.Controllers;

public class CakeController: DefaultApiController
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
}