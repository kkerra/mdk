using LabWork23.Data;
using LabWork23.DTOs;
using LabWork23.Models;
using Microsoft.EntityFrameworkCore;

namespace LabWork23
{
    public class SessionService
    {
        private readonly AppDbContext _context = new();

        public IQueryable<Session> GetAll()
            => _context.Sessions
                .Include(c => c.Movie)
                .Include(c => c.Hall)
                .AsQueryable();

        public async Task<List<SessionDto>> GetAllByCinemaAsync(DateTime date, string cinema = null)
            => await GetAll()
                .Where(s => s.DateTime.Date == date.Date)
                .Where(s => s.Hall.Cinema == cinema)
                .Select(s => new SessionDto
                {
                    Id = s.SessionId,
                    MovieTitle = s.Movie.Title,
                    HallNumber = s.Hall.HallNumber,
                    Start = s.DateTime.TimeOfDay,

                })
                .OrderBy(s => s.MovieTitle)
                .ThenBy(s => s.Start)
                .ToListAsync();

        public async Task<List<Session>> GetAllByFilmAsync(DateTime date, string movie)
            => await _context.Sessions
                .Include(c => c.Movie)
                .Include(c => c.Hall)
                .Where(s => s.DateTime.Date == date.Date)
                .Where(s => s.Movie.Title == movie)
                .ToListAsync();
    }
}
