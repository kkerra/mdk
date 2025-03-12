using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PractWork1.Data;
using PractWork1.Models;

namespace PractWork1.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class MoviesController : ControllerBase
    {
        private readonly AppDbContext _context;

        public MoviesController(AppDbContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Получить все фильмы
        /// </summary>
        /// <returns>Список фильмов</returns>
        /// <response code="200">Фильмы успешно получены</response>
        /// <response code="404">Фильмы не найдены</response>
        // GET: api/Movies
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<IEnumerable<Movie>>> GetMovies()
        {
            return await _context.Movies.ToListAsync();
        }

        /// <summary>
        /// Фильтрация фильмов
        /// </summary>
        /// <param name="title">название фильма</param>
        /// <param name="sortBy">столбец сортировки</param>
        /// <param name="page">страница</param>
        /// <param name="pageSize">размер страницы</param>
        /// <returns>Отфильтрованный список фильмов</returns>
        /// <response code="200">Фильмы успешно получены</response>
        /// <response code="404">Фильмы не найдены</response>
        [HttpGet("filter")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<IEnumerable<Movie>>> GetSortedMovies(string? title, string? sortBy, int page = 1, int pageSize = 3)
        {
            var query = _context.Movies.AsQueryable();
            //filter
            if (!String.IsNullOrEmpty(title))
                query = query.Where(x => x.Title.Contains(title));
            //sort
            query = sortBy?.ToLower() switch
            {
                "номер" => query.OrderBy(c => c.MovieId),
                "название" => query.OrderBy(c => c.Title),
                "дата проката" => query.OrderByDescending(c => c.RentalBeginning),
                "год выпуска" => query.OrderByDescending(c => c.ReleaseYear),
                _ => query
            };
            //pagination
            var items = await query.Skip(pageSize * (page - 1)).Take(pageSize).ToListAsync();
            return items;
        }

        /// <summary>
        /// Информация о фильме по id
        /// </summary>
        /// <param name="id">Номер фильма</param>
        /// <returns>Данные о фильме по id</returns>
        /// <response code="200">Фильмы успешно получены</response>
        /// <response code="404">Фильмы не найдены</response>
        // GET: api/Movies/5
        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<Movie>> GetMovie(int id)
        {
            var movie = await _context.Movies.FindAsync(id);

            if (movie == null)
            {
                return NotFound($"Фильм с {id} не найден");
            }

            return movie;
        }

        /// <summary>
        /// обновление фильма по номеру
        /// </summary>
        /// <param name="id">номер фильма </param>
        /// <param name="movie">информция о фильме</param>
        /// <returns></returns>
        // PUT: api/Movies/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMovie(int id, Movie movie)
        {
            if (id != movie.MovieId)
                return BadRequest();
            if (String.IsNullOrWhiteSpace(movie.Title))
                return BadRequest("название не может быть пустой строкой или состоять из пробельных символов");
            if (movie.ReleaseYear <= 1900 && movie.ReleaseYear >= DateTime.Now.Year)
                return BadRequest("год выхода не может быть раньше 1900 и позже следующего года");
            if (movie.Duration <= 0)
                return BadRequest("длительность должна быть больше нуля");

            _context.Entry(movie).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MovieExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        /// <summary>
        /// создание фильма
        /// </summary>
        /// <param name="movie">создаваемый объект</param>
        /// <returns></returns>
        // POST: api/Movies
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Movie>> PostMovie(Movie movie)
        {
            if (String.IsNullOrWhiteSpace(movie.Title))
                return BadRequest("название не может быть пустой строкой или состоять из пробельных символов");
            if (movie.ReleaseYear <= 1900 && movie.ReleaseYear >= DateTime.Now.Year)
                return BadRequest("год выхода не может быть раньше 1900 и позже следующего года");
            if (movie.Duration <= 0)
                return BadRequest("длительность должна быть больше нуля");

            _context.Movies.Add(movie);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMovie", new { id = movie.MovieId }, movie);
        }

        // DELETE: api/Movies/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMovie(int id)
        {
            var movie = await _context.Movies.FindAsync(id);
            if (movie == null)
            {
                return NotFound();
            }

            _context.Movies.Remove(movie);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool MovieExists(int id)
        {
            return _context.Movies.Any(e => e.MovieId == id);
        }
    }
}
