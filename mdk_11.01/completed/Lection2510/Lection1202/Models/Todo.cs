namespace Lection1202.Models
{
    public class Todo
    {
        public int UserId { get; set; }
        public int Id { get; set; }
        public required string Title { get; set; }
        public bool Completed { get; set; }

    }
}
