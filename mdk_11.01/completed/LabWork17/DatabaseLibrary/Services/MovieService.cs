using DatabaseLibrary.Data;
using DatabaseLibrary.Helpes;
using DatabaseLibrary.Models;
using Microsoft.EntityFrameworkCore;

namespace DatabaseLibrary.Services
{
    public class MovieService
    {
        private readonly AppDbContext _context = new();

        public List<string> GetRatingsAsync()
        {
            return _context.Movies.Select(m => m.AgeRating).Distinct().ToList();
        }

        public List<Movie> GetMovies(Paginator? paginator = null, Sorter? sorting = null)
        {
            var movies = _context.Movies
                                .AsQueryable()
                                //.Include(m => m.Genres)
                                .AsNoTracking();

            if (sorting != null)
                movies = sorting.IsAscending
                    ? movies.OrderBy(g => EF.Property<object>(g, sorting.OrderColumn))
                    : movies.OrderByDescending(g => EF.Property<object>(g, sorting.OrderColumn));

            if (paginator != null)
                movies = movies
                        .Skip(paginator.PageSize * (paginator.PageNumber - 1))
                        .Take(paginator.PageSize);

            return movies.ToList();
        }

        public Movie GetMovieById(int id)
            => _context.Movies.Find(id);

        public async Task RemoveMovieAsync(Movie movie)
        {
            _context.Movies.Remove(movie);
            await _context.SaveChangesAsync();
        }

        public async Task AddMovieAsync(Movie movie)
        {
            _context.Movies.Add(movie);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateMovieAsync(Movie movie)
        {
            _context.Movies.Update(movie);
            await _context.SaveChangesAsync();
        }
    }
}
