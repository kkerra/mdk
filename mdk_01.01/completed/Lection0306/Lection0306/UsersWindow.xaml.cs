using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Lection0306
{
    /// <summary>
    /// Логика взаимодействия для UsersWindow.xaml
    /// </summary>
    public partial class UsersWindow : Window
    {
        public UsersWindow()
        {
            InitializeComponent();

            var users = new List<User>()
            {
                new User() {Login="123", Password="123"},
                new User() {Login="1234", Password="1234"},
                new User() {Login="12345", Password="12345"},
            };

            usersListView.ItemsSource = users;
        }
    }
}
