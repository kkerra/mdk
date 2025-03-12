using LabWork20.Models;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Xml.Linq;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LabWork20.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GamesController : ControllerBase
    {
        static List<Game> games = new List<Game>
        {
            new Game{IdGame = 1, Name = "Tetris", Category = "головоломка", Price = 150},
            new Game{IdGame = 2, Name = "Flappy Bird", Description = "игра про летучую птицу", Category = "платформер", Price = 10},
            new Game{IdGame = 3, Name = "Pac-man", Description = "игра про колобка", Category = "аркада", Price = 300},
            new Game{IdGame = 4, Name = "Arkanoid", Category = "аркада", Price = 400},
            new Game{IdGame = 5, Name = "Mario", Description = "игра про Марио", Category = "платформер", Price = 1000},
            new Game{IdGame = 6, Name = "Tetris2", Category = "головоломка", Price = 150},
            new Game{IdGame = 7, Name = "Flappy Bird2", Description = "игра про летучую птицу", Category = "платформер", Price = 10},
            new Game{IdGame = 8, Name = "Pac-man2", Description = "игра про колобка", Category = "аркада", Price = 300},
            new Game{IdGame = 9, Name = "Arkanoid2", Category = "аркада", Price = 400},
            new Game{IdGame = 10, Name = "Mario2", Description = "игра про Марио", Category = "платформер", Price = 1000},
        };

        // GET: api/<GamesController>
        [HttpGet]
        public IEnumerable<Game> Get(int? limit, int? page)
        {
            if (limit != null && page != null)
                return games.Skip((int)limit * ((int)page - 1)).Take((int)limit);
            return games;
        }

        [HttpGet("{category}")]
        public IEnumerable<Game> GetGameByCategory(string category)
        {
            return games.Where(game => game.Category.Equals(category));
        }

        // GET api/<GamesController>/5
        [HttpGet("{idGame:int}")]
        public Game GetById(int idGame)
        {
            return games.FirstOrDefault(game => game.IdGame == idGame);
        }

        // POST api/<GamesController>
        [HttpPost]
        public void Post([FromBody] Game value)
        {
        }

        // PUT api/<GamesController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Game value)
        {
        }

        // DELETE api/<GamesController>/5
        [HttpDelete("{idGame}")]
        public void Delete(int idGame)
        {
            var deletingGame = games.FirstOrDefault(game => game.IdGame == idGame);
            games.Remove(deletingGame);
        }
    }
}
