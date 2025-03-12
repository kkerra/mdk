using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Лекция_9._03
{
    public enum Color
    {
        Black,   //0
        Red,     //1
        Yellow,  //2 
        Blue = 4, //4
        Green = Blue | Yellow, // 6
        White = Red | Yellow | Blue 
    }
}
