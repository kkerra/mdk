using Microsoft.EntityFrameworkCore;

namespace LabWork16
{
    public class VisitorService
    {
        public async Task<List<Visitor>> GetVisitorsAsync()
        {
            using var context = new AppDbContext();
            return await context.Visitors.ToListAsync();
        }

        public async Task AddVisitorAsync(Visitor visitor)
        {
            using var context = new AppDbContext();
            context.Visitors.Add(visitor);
            await context.SaveChangesAsync();
        }

        public async Task UpdateVisitorAsync(Visitor visitor)
        {
            using var context = new AppDbContext();
            var currentVisitor = await context.Visitors.FindAsync(visitor.VisitorId);
            if (currentVisitor != null)
            {
                currentVisitor.Name = visitor.Name;
                currentVisitor.Phone = visitor.Phone;
                currentVisitor.Birthday = visitor.Birthday;
                currentVisitor.Email = visitor.Email;
                await context.SaveChangesAsync();
            }
        }

        public async Task DeleteVisitorAsync(int id)
        {
            using var context = new AppDbContext();
            var visitor = await context.Visitors.FindAsync(id);
            if (visitor != null)
            {
                context.Visitors.Remove(visitor);
                await context.SaveChangesAsync();
            }
        }


    }
}
