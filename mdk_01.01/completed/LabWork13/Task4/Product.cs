namespace Task4
{
    internal class Product
    {
        public string Name { get; set; }
        public double Price { get; set; }
        public DateTime ShelfLife { get; set; }

        public override string ToString()
        {
            return $"{Name}, {Price:F2}, {ShelfLife:yyyy-MM-dd}";
        }
    }
}
