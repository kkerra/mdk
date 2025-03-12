int Sum(int a, int b) => a + b;

int r1 = 2, r2 = 1;
double s = Math.PI * (r1 - r2) * (r1 + r2);
if (s < 0)
    s = -s;

int n = 10;
int sum = n * (n + 1) / 2;

double GetPower(double x, int n)
{
    if (n == 0)
        return 1;
    if (n < 0)
        return 1 / GetPower(x, -n);
    if (n % 2 == 0)
    {
        double temp = GetPower(x, n / 2);
        return temp * temp;
    }
    return x * GetPower(x, n - 1);
}

int GetDaysCount(int month, int year)
{
    if (month >= 1 && month <= 12)
    {
        switch (month)
        {
            case 4:
            case 6:
            case 9:
            case 11:
                return 30;
            case 2:
                return (year % 400 == 0 || year % 100 != 0 && year % 4 == 0) ? 29 : 28;
            default:
                return 31;
        }
    }
    return -1;
}

string GetSize(int bytes)
{
    if (bytes >> 10 == 0)
        return $"{bytes} Б";
    if (bytes >> 20 == 0)
        return $"{bytes >> 10} КБ";
    if (bytes >> 30 == 0)
        return $"{bytes >> 20} МБ";
    return $"{bytes >> 30} ГБ";
}