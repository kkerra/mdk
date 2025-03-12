using System.ComponentModel.DataAnnotations.Schema;

namespace LabWork16
{
    [Table("Visitor")]
    public class Visitor
    {
        public int VisitorId { get; set; }
        public string Phone { get; set; }
        public string Name { get; set; }
        public DateTime Birthday { get; set; }
        public string Email { get; set; }

        public List<Ticket> Tickets { get; set; }
    }
}
