using LabWork20.Data;
using LabWork20.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LabWork20.Services
{
    public class MovieService
    {
        private readonly AppDbContext _context = new();

        public async Task<List<Movie>> GetMoviesAsync() 
            => await _context.Movies.ToListAsync();
    }
}
