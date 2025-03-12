using System.Configuration;
using System.Windows;

namespace Task2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            if (loginTextBox.Text == ConfigurationManager.AppSettings.Get("login")
               && passwordTextBox.Text == ConfigurationManager.AppSettings.Get("password"))
            {
                AuthorizationForm form = new();
                form.ShowDialog();
            }
            else
            {
                MessageBox.Show($"Данные не совпадают");
            }
        }
    }
}