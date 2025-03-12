using Task2;

User user = new();
user.UserChanged += User_UserChanged;
user.Login = "abc";

void User_UserChanged(object? sender, EventArgs e)
{
    User currentUser = sender as User;
    Console.WriteLine($"Изменены данные пользователя со следующим логином: {currentUser.Login}");
}