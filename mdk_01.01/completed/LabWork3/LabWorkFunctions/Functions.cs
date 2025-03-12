namespace LabWorkFunctions
{
    public static class Functions
    {
        public static int GetFactorial(int n)
        {
            if (n == 0)
            {
                return 1;
            }
            if (n > 0)
            {
                return n * GetFactorial(n - 1);
            }
            return 0;
        }

        public static double GetPower(double x, int n)
        {
            if (n == 0)
            {
                return 1;
            }
            if (n < 0)
            {
                return 1 / GetPower(x, -n);
            }

            if (n % 2 == 0)
            {
                double temp = GetPower(x, n / 2);
                return temp * temp;
            }
            else
            {
                return x * GetPower(x, n / 2);
            }
        }
    }
}
