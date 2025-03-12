using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApp.Models;
using WebApp.Services;

namespace WebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly TokenService _tokenService;

        public AccountController(TokenService tokenService)
        {
            _tokenService = tokenService;
        }

        [HttpPost]
        public IActionResult Login(User user)
        {
            if (String.IsNullOrWhiteSpace(user.Login))
                return BadRequest("логин не указан");
            if (String.IsNullOrWhiteSpace(user.Password))
                return BadRequest("пароль не указан");

            if(user.Login != "admin" || user.Password != "qwerty")
                return NotFound("пользователь не найден");
            var token = _tokenService.GenerateToken(user.Login);
            return Ok(token);
        }
    }
}
