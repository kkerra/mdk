using System.Windows;

namespace Task1
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
            if (Properties.Settings.Default.login == loginTextBox.Text
                && Properties.Settings.Default.password == passwordTextBox.Text)
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