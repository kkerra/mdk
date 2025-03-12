using DatabaseLibrary.Data;
using DatabaseLibrary.Helpes;
using DatabaseLibrary.Models;
using Microsoft.EntityFrameworkCore;

namespace DatabaseLibrary.Services
{
    public class TicketService
    {
        private readonly AppDbContext _context = new();

        public async Task<List<Ticket>> GetTicketsAsync(int pageSize, int pageIndex, Sorter sorting)
        {
            var tickets = _context.Tickets
                                .AsNoTracking()
                                .Include(t => t.Visitor)
                                .AsQueryable();
                                
            if (sorting != null)
                tickets = sorting.IsAscending
                    ? tickets.OrderBy(g => EF.Property<object>(g, sorting.OrderColumn))
                    : tickets.OrderByDescending(g => EF.Property<object>(g, sorting.OrderColumn));

            return await tickets
                .AsNoTracking()
                .Skip(pageSize * (pageIndex - 1))
                .Take(pageSize)
                .ToListAsync();
        }

        public async Task<Ticket> GetTicketByIdAsync(int id)
        {
            return await _context.Tickets
                .AsNoTracking()
                .FirstOrDefaultAsync(g => g.TicketId == id);
        }
    }
}
