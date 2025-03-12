using System.ComponentModel.DataAnnotations.Schema;

namespace MigrationApp
{
    public class Group
    {
        public int GroupId { get; set; }
        [Column(TypeName = "nvarchar(10)")]
        public string Name { get; set; }

        public List<Student> Students { get; set; } = new List<Student>();
    }
}