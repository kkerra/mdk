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

namespace Task5
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        List<User> users = [
           new User() {Id = 1, Login = "a", Password = "1"},
            new User() {Id = 2, Login = "ab", Password = "12"},
            new User() {Id = 3, Login = "abc", Password = "123"},
            new User() {Id = 4, Login = "abcd", Password = "1234"},
            new User() {Id = 5, Login = "abce", Password = "1235"},
            ];
        public MainWindow()
        {
            InitializeComponent();

            usersComboBox.ItemsSource = users;
            usersListBox.ItemsSource = users;
            usersListView.ItemsSource = users;
        }
    }
}