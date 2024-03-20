using Api.Domains;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers;

public class CakeController: DefaultApiController
{
    [HttpGet]
    [Route("test/{randNum:guid}")]
    public ActionResult<List<Cake>> Test(DefaultIdType randNum)
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