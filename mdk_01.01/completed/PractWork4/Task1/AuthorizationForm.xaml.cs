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

namespace Task1
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationForm.xaml
    /// </summary>
    public partial class AuthorizationForm : Window
    {
        public AuthorizationForm()
        {
            InitializeComponent();
            emailTextBox.Text = Properties.Settings.Default.email;
            loginTextBox.Text = Properties.Settings.Default.login;
            passwordTextBox.Text = Properties.Settings.Default.password;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            Properties.Settings.Default.email = emailTextBox.Text;
            Properties.Settings.Default.login = loginTextBox.Text;
            Properties.Settings.Default.password = passwordTextBox.Text;
            Properties.Settings.Default.Save();
            MessageBox.Show("Данные сохранены");
        }

        void ChangeTheme(string themeName)
        {
            Application.Current.Resources.Clear();
            Uri uriDict = new("Themes/Light.xaml", UriKind.Relative);
            ResourceDictionary dictionary = Application.LoadComponent(uriDict) as ResourceDictionary;
            Application.Current.Resources.MergedDictionaries.Add(dictionary);

            uriDict = new Uri($"Themes/{themeName}.xaml", UriKind.Relative);
            dictionary = Application.LoadComponent(uriDict) as ResourceDictionary;
            Application.Current.Resources.MergedDictionaries.Add(dictionary);
        }

        private void DarkThemeButton_Click(object sender, RoutedEventArgs e)
        {
            ChangeTheme("Dark");
        }

        private void LightThemeButton_Click(object sender, RoutedEventArgs e)
        {
            ChangeTheme("Light");
        }
    }
}
