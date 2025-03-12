using Microsoft.EntityFrameworkCore;

namespace LabWork16
{
    public class TicketService
    {
        public async Task<List<Ticket>> GetTicketsAsync()
        {
            using var context = new AppDbContext();
            return await context.Tickets.ToListAsync();
        }

        public async Task AddTicketAsync(Ticket ticket)
        {
            using var context = new AppDbContext();
            context.Tickets.Add(ticket);
            await context.SaveChangesAsync();
        }

        public async Task UpdateTicketAsync(Ticket ticket)
        {
            using var context = new AppDbContext();
            var currentTicket = await context.Tickets.FindAsync(ticket.TicketId);
            if (currentTicket != null)
            {
                currentTicket.Place = ticket.Place;
                currentTicket.SessionId = ticket.SessionId;
                currentTicket.VisitorId = ticket.VisitorId;
                currentTicket.Row = ticket.Row;
                await context.SaveChangesAsync();
            }
        }

        public async Task DeleteTicketAsync(int id)
        {
            using var context = new AppDbContext();
            var ticket = await context.Tickets.FindAsync(id);
            if (ticket != null)
            {
                context.Tickets.Remove(ticket);
                await context.SaveChangesAsync();
            }
        }


    }
}
