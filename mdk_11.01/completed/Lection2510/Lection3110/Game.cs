using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lection3110
{
    [Table("Game")]
    public class Game
    {
        public int GameId { get; set; }
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public bool IsDeleted { get; set; }
        public int TotalKeys { get; set; }

        public Category Category { get; set; } // 1
    }
}
