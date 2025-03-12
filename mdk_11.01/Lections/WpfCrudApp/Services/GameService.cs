using WpfCrudApp.Models;
using WpfCrudApp.Data;
using Microsoft.EntityFrameworkCore;

namespace WpfCrudApp.Services
{
    public class GameService
    {
        private readonly GameContext _context = new();

        public async Task<List<Game>> GetAllGamesAsync()
            => await _context.Games.Include(g => g.Category).ToListAsync();

        public async Task<List<Category>> GetAllCategoriesAsync()
            => await _context.Categories.ToListAsync();

        public async Task RemoveGameAsync(Game game)
        {
            _context.Games.Remove(game);
            await _context.SaveChangesAsync();
        }

        public async Task AddGameAsync(Game game)
        {
            _context.Games.Add(game);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateGameAsync(Game game)
        {
            _context.Games.Update(game);
            await _context.SaveChangesAsync();
        }
    }
}
