using System.IO;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Task3
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        string userDataFile = "userData.txt";
        public MainWindow()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            using StreamReader reader = new(userDataFile);
            if (loginTextBox.Text == reader.ReadLine() && passwordTextBox.Text == reader.ReadLine())
            {
                AuthorizationForm form = new();
                form.ShowDialog();
            }
            else
            {
                MessageBox.Show($"Данные не совпадают");
            }
            reader.Close();
        }
    }
}