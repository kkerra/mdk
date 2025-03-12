namespace Task4
{
    internal class Functions
    {
        public static double CalculateFunctions(double x, int n)
        {
            if (n < 0 || (x == 0 && n == 0) || x == 0)
            {
                return -1;
            }

            if (n == 0)
            {
                return 1;
            }

            double result = 1;
            for (int i = 0; i < n; i++)
            {
                result *= x;
            }
            return 1 / result;
        }

        public static double CalculateFunctions(double x)
        {
            if (x == 0)
            {
                return -1;
            }

            return 1 / x;
        }
    }
}
