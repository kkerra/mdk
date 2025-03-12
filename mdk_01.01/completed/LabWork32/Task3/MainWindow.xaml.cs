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
        List<User> users = [
            new User() {Id = 1, Login = "a", Password = "1"},
            new User() {Id = 2, Login = "ab", Password = "12"},
            new User() {Id = 3, Login = "abc", Password = "123"},
            new User() {Id = 4, Login = "abcd", Password = "1234"},
            new User() {Id = 5, Login = "abcde", Password = "12345"},
            ];
        public MainWindow()
        {
            InitializeComponent();

            usersComboBox.ItemsSource = users;
            usersListBox.ItemsSource = users;
            usersListView.ItemsSource = users;
        }

        private void UsersListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            string selectedUsers = "";
            foreach (User user in usersListBox.SelectedItems)
                selectedUsers += $"{user.Login} ";
            usersListBoxLabel.Content = selectedUsers;
        }

        private void UsersListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            string selectedUsers = "";
            foreach (User user in usersListView.SelectedItems)
                selectedUsers += $"{user.Login} ";
            usersListViewLabel.Content = selectedUsers;
        }

        private void UsersComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            User selectedUser = (User)usersComboBox.SelectedItem;
            usersComboBoxLabel.Content = $"Id: {selectedUser.Id}, логин: {selectedUser.Login}, пароль: {selectedUser.Password}";
        }
    }
}