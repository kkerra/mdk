using LabWork21.Data;
using LabWork21.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LabWork21.Services
{
    class GamesService
    {
        private readonly AppDbContext _context;

        public GamesService()
        {
            _context = new AppDbContext();
        }

        public void AddLogo(int gameId, string filepath)
        {
            Game game = _context.Lw21games.SingleOrDefault(g => g.GameId == gameId);
            if (game == null)
            {
                throw new Exception("Игра не найдена");
            }
            game.LogoFile = filepath;
            _context.SaveChanges();
        }
    }
}
