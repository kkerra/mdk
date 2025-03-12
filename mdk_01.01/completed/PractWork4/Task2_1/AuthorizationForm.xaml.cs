using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
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

namespace Task2
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationForm.xaml
    /// </summary>
    public partial class AuthorizationForm : Window
    {
        public AuthorizationForm()
        {
            InitializeComponent();

            loginTextBox.Text = ConfigurationManager.AppSettings.Get("login");
            passwordTextBox.Text = ConfigurationManager.AppSettings.Get("password");
            emailTextBox.Text = ConfigurationManager.AppSettings.Get("email");
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            config.AppSettings.Settings["login"].Value = loginTextBox.Text;
            config.AppSettings.Settings["password"].Value = passwordTextBox.Text;
            config.AppSettings.Settings["email"].Value = emailTextBox.Text;
            config.Save();
        }
    }
}
