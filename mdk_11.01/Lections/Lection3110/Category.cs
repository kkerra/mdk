using System.ComponentModel.DataAnnotations.Schema;

namespace Lection3110
{
    [Table("Category")]
    public class Category
    {
        public int CategoryId { get; set; }
        public string Name { get; set; }

        public List<Game> Games { get; set; } //M
    }
}
