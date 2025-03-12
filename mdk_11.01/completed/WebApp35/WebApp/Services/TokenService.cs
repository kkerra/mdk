using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace WebApp.Services
{
    public class TokenService
    {
        private readonly IConfiguration _config;

        public TokenService(IConfiguration config)
        {
            _config = config;
        }

        public string GenerateToken(string login)
        {
            var key = Encoding.UTF8.GetBytes(_config["JWT:Key"]);
            var credentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256);
            var claims = new List<Claim>()
            {
                new(ClaimTypes.NameIdentifier, login),
                new(ClaimTypes.Role, "Admin"), // можно получить из данных пользователя
            };

            var token = new JwtSecurityToken(
                claims: claims,
                signingCredentials: credentials,
                expires: DateTime.Now.AddMinutes(30)
                //, issuer: _config["JWT:Issuer"], audience: _config["JWT:Audience"]
                );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
