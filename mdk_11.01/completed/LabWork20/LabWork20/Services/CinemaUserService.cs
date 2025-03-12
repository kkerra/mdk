using LabWork20.Data;
using LabWork20.Models;
using Microsoft.EntityFrameworkCore;

namespace LabWork20.Services
{
    public class CinemaUserService
    {
        private readonly AppDbContext _context = new();

        public CinemaUser Authentication(string login, string password)
        {
            return _context.CinemaUsers
                                .AsNoTracking()
                                .SingleOrDefault(u => u.Login == login && u.Password == password);

        }
    }
}
