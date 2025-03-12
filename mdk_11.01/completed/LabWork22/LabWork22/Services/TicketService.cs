using LabWork22.Data;
using LabWork22.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LabWork22.Services
{
    public class TicketService
    {
        private readonly AppDbContext _context = new();

        public Ticket GetTicketById(int ticketId)
        {
            return _context.Tickets
                .Include(t => t.Session)
                .ThenInclude(s => s.Movie)
                .Include(t => t.Session)
                .ThenInclude(s => s.Hall)
                .SingleOrDefault(t => t.TicketId == ticketId);
        }

        public void SaveTicketToPdf(string ticketDetails)
        {

        }
    }
}
