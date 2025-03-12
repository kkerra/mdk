namespace ConsoleApp1
{
    static class Functions
    {
        public static void GetAbsolute(ref int x)
        {
            if (x < 0)
                x = -x;

        }

        public static int Sum(int a, int b) => a + b;

        public static double Sum(double a, double b) => a + b;

        public static int Sum(int a, int b, int c) => a + b + c;
    }
}
