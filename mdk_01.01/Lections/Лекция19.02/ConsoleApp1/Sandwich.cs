using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    internal class Sandwich
    {
        public int Weight { get; set; }

        public static Sandwich operator +(Sandwich sandwich, Bread ingredient)
            => new Sandwich() { Weight = sandwich.Weight + ingredient.Weight };

        public static Sandwich operator +(Sandwich sandwich, Cheese ingredient)
            => new Sandwich() { Weight = sandwich.Weight + ingredient.Weight };

        public static Sandwich operator +(Sandwich sandwich, Ham ingredient)
            => new Sandwich() { Weight = sandwich.Weight + ingredient.Weight };
    }
    
    internal class Bread
    {
        public int Weight { get; set; }
    }
    internal class Ham
    {
        public int Weight { get; set; }
    }
    internal class Cheese
    {
        public int Weight { get; set; }
    }
}
