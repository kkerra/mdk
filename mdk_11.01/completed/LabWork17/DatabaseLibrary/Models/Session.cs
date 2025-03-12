using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseLibrary.Models
{
    public class Session
    {
        public int SessionId { get; set; }
        public decimal Price { get; set; }
        public DateTime DateTime { get; set; }
        public bool Is3D { get; set; }
    }
}
