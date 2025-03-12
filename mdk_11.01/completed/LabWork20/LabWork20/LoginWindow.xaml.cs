using LabWork20.Services;
using System.Windows;

namespace LabWork20
{
    /// <summary>
    /// Логика взаимодействия для LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        CinemaUserService _service = new();

        public LoginWindow()
        {
            InitializeComponent();
        }

        private async void OkButton_ClickAsync(object sender, RoutedEventArgs e)
        {
            var user = _service.Authentication(LoginTextBox.Text, PasswordTextBox.Text);
            if (user == null)
            {
                MessageBox.Show($"Некорректные данные.");
            }
            else
            {
                MessageBox.Show($"Добро пожаловать, {LoginTextBox.Text}");
                UserSession.Instance.SetCurrentUser(user);
                DialogResult = true;
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
