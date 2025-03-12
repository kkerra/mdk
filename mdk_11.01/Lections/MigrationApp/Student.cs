using System.ComponentModel.DataAnnotations;

namespace MigrationApp
{
    public class Student
    {
        public int StudentId { get; set; }
        public int GroupId { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }
        public int? Age { get; set; } //? - не обяз.

        public Group Group { get; set; }
    }
}