using System;

namespace LabWorkLibrary
{
    public class Maths
    {
        /// <summary>
        /// Константа 
        /// </summary>
        public const int binaryFactory = 1024;

        /// <summary>
        /// Вычисляет сумму двух чисел
        /// </summary>
        /// <param name="x">1 слагаемое</param>
        /// <param name="y">2 слагаемое</param>
        /// <returns>Сумма двух чисел</returns>
        public static double GetSum(double x, double y)
            => x + y;

        /// <summary>
        /// Вычисляет разность двух чисел
        /// </summary>
        /// <param name="x">Уменьшаемое</param>
        /// <param name="y">Вычитаемое</param>
        /// <returns>Разность двух чисел</returns>
        public static double GetDifference(double x, double y)
            => x - y;

        /// <summary>
        /// Вычисляет произведение двух чисел
        /// </summary>
        /// <param name="x">1 множитель</param>
        /// <param name="y">2 множитель</param>
        /// <returns>Произведение двух чисел</returns>
        public static double GetMultiplication(double x, double y)
            => x * y;

        /// <summary>
        /// Вычисляет деление двух чисел
        /// </summary>
        /// <param name="x">Делимое</param>
        /// <param name="y">Делитель</param>
        /// <returns>Частное двух чисел</returns>
        /// <exception cref="DivideByZeroException">Деление на ноль</exception>
        public static double GetDivision(double x, double y)
        {
            if (y == 0)
                throw new DivideByZeroException("Деление на ноль");
            return x / y;
        }

        /// <summary>
        /// Вычисляет площадь прямоугольника
        /// </summary>
        /// <param name="x">Длина</param>
        /// <param name="y">Ширина</param>
        /// <returns>Площадь прямоугольника</returns>
        /// <exception cref="ArgumentException">Некорректно введенные данные</exception>
        public static double GetArea(double x, double y)
        {
            if (x < 0 || y < 0)
                throw new ArgumentException("Длина или ширина некорректны");
            return x * y;
        }
    }
}
