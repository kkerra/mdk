using System.ComponentModel.DataAnnotations.Schema;

namespace LabWork16
{
    [Table("Ticket")]
    public class Ticket
    {
        public int TicketId { get; set; }
        public int SessionId { get; set; }
        public int VisitorId { get; set; }
        public byte Place { get; set; }
        public byte Row { get; set; }

        public Visitor Visitor { get; set; }
    }
}
