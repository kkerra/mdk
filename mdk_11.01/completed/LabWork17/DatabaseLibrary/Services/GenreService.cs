using DatabaseLibrary.Data;
using DatabaseLibrary.DTOs;
using DatabaseLibrary.Helpes;
using DatabaseLibrary.Models;
using Microsoft.EntityFrameworkCore;

namespace DatabaseLibrary.Services
{
    public class GenreService
    {
        private readonly AppDbContext _context = new();
        public List<GenreDto> GetAllGenreDto()
        {
            return _context.Genres
                .AsNoTracking()
                .Include(g => g.Movies)
                .Select(g => new GenreDto
                {
                    Name = g.Name,
                    MoviesCount = g.Movies.Count
                })
                .ToList();
        }

        public async Task<List<Genre>> GetGenresAsync(Paginator? paginator = null, Sorter? sorting = null, GenreFilter? filter = null)
        {
            var genres = _context.Genres
                                .AsQueryable()
                                //.Include(g => g.Movies)
                                .AsNoTracking();
                                
            if (filter != null)
                genres = FilterData(filter, genres);

            if (sorting != null)
                genres = sorting.IsAscending
                    ? genres.OrderBy(g => EF.Property<object>(g, sorting.OrderColumn))
                    : genres.OrderByDescending(g => EF.Property<object>(g, sorting.OrderColumn));

            if (paginator != null)
                genres = genres
                        .Skip(paginator.PageSize * (paginator.PageNumber - 1))
                        .Take(paginator.PageSize);

            return await genres.ToListAsync();
        }

        private static IQueryable<Genre> FilterData(GenreFilter? filter, IQueryable<Genre> genres)
        {
            if (filter.MaxId.HasValue)
                genres = genres.Where(g => g.GenreId <= filter.MaxId);
            if (filter.HasMovies.HasValue)
                genres = genres.Where(g => filter.HasMovies.Value ? g.Movies.Count > 0 : g.Movies.Count == 0);
            if (!String.IsNullOrEmpty(filter.Name))
                genres = genres.Where(g => g.Name == filter.Name);
            if (!String.IsNullOrEmpty(filter.StartName))
                genres = genres.Where(g => g.Name.StartsWith(filter.StartName));
            return genres;
        }

        public Genre? GetGenreById(int id)
        {
            return _context.Genres.Find(id);
        }
    }
}
