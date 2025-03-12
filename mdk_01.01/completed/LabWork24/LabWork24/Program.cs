internal partial class Program
{
    internal class User
    {
        private string _login;
        private string _password;

        public bool IsCorrectUserData(string login, string password, string passwordVerification)
        {
            bool isLoginCorrect = login.Length > 0;
            bool isPasswordCorrect = password.Length > 0;
            bool isConfirmCorrect = password == passwordVerification;
            if (isLoginCorrect && isPasswordCorrect && isConfirmCorrect)
                return true;
            return false;
        }

        public void SetUserData(string login, string password)
        {
            _login = login;
            _password = password;
        }
    }

    public static int GetDaysCount(int month, int year)
    {
        if (month >= 1 && month <= 12)
        {
            int[] daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
            if (month == 2)
                return (year % 400 == 0 || year % 100 != 0 && year % 4 == 0) ? daysInMonth[1] + 1 : daysInMonth[1];
            return daysInMonth[month - 1];
        }
        throw new ArgumentException("Некорректный месяц");
    }

    private static void Main(string[] args)
    {
        User user = new();
        Console.WriteLine("Введите логин");
        string login = Console.ReadLine();
        Console.WriteLine("Введите пароль");
        string password = Console.ReadLine();
        Console.WriteLine("Подтвердите пароль");
        string confirmPassword = Console.ReadLine();
        if (user.IsCorrectUserData(login, password, confirmPassword))
        {
            Console.WriteLine("Успешная регистрация");
            user.SetUserData(login, password);
        }
        else
            Console.WriteLine("Ошибка регистрации");

        Console.WriteLine(GetDaysCount(1, 2023));
    }
}