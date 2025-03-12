using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Channels;
using System.Threading.Tasks;

namespace Lection28._03
{
    internal class SensorView
    {
        public void PrintInfo(int temperature, int humidity)
            => Console.WriteLine($"t = {temperature}, h = {humidity}");
    }
}
