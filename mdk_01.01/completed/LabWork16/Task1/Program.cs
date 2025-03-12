using Task1;

User user = new();
user.PropertyChanged += User_PropertyChanged;

user.Login = "abc";
user.Password = "abc";
user.Password = "abcd";


void User_PropertyChanged(object? sender, System.ComponentModel.PropertyChangedEventArgs e)
{
    Console.WriteLine(e.PropertyName);
}