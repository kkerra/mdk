using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LabWork23.DTOs
{
    public class SessionDto
    {
        public int Id { get; set; }
        public string MovieTitle { get; set; }
        public string Cinema { get; set; }
        public byte? HallNumber { get; set; }
        public TimeSpan Start { get; set; }
        public TimeSpan End { get; set; }
        public int Duration { get; set; }
        public decimal Price { get; set; }
    }
}
