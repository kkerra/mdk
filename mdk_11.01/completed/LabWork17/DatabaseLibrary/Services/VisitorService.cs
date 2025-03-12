using DatabaseLibrary.Data;
using DatabaseLibrary.Helpes;
using DatabaseLibrary.Models;
using Microsoft.EntityFrameworkCore;

namespace DatabaseLibrary.Services
{
    public class VisitorService
    {
        private readonly AppDbContext _context = new();

        public async Task<List<Visitor>> GetVisitorsAsync(int pageSize, int pageIndex, Sorter sorting)
        {
            var visitors = _context.Visitors
                                .AsNoTracking()
                                .Include(v => v.Tickets)
                                .AsQueryable();
            if (sorting != null)
                visitors = sorting.IsAscending
                    ? visitors.OrderBy(g => EF.Property<object>(g, sorting.OrderColumn))
                    : visitors.OrderByDescending(g => EF.Property<object>(g, sorting.OrderColumn));

            return await visitors
                .Skip(pageSize * (pageIndex - 1))
                .Take(pageSize)
                .ToListAsync();
        }

        public async Task<Visitor> GetVisitorByIdAsync(int id)
        {
            return await _context.Visitors
                .AsNoTracking()
                .FirstOrDefaultAsync(g => g.VisitorId == id);
        }
    }
}
