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

        private void RegisterButton_Click(object sender, RoutedEventArgs e)
        {
            if(inputPasswordBox.Password == verificationPasswordBox.Password)
            {
                MessageBox.Show($"{loginTextBox.Text}, вы зарегистрированы");
            }
            else
            {
                MessageBox.Show("Ошибка при подтверждении пароля");
            }
        }

        private void DatePicker_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            birthdayLabel.Content = $"Дата рождения {birthdayDatePicker.SelectedDate}";
        }
    }
}