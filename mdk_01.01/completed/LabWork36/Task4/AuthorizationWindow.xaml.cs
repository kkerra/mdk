using System.Windows;

namespace Task4
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow : Window
    {
        public AuthorizationWindow()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            if (loginTextBox.Text == "admin" && passwordTextBox.Text == "qwerty")
            {
                Hide();
                AdminWindow admin = new();
                admin.Show();
            }
            if (loginTextBox.Text == "manager" && passwordTextBox.Text == "12345")
            {
                Hide();
                ManagerWindow manager = new();
                manager.Show();
            }
            else
            {
                MessageBox.Show("Данные некорректны", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            Show();
        }
    }
}
