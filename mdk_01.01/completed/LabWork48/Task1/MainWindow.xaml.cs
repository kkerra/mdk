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

        private void InsertAuthorButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MessageBox.Show($"Добавлено: {DataAccessLayer.InsertAuthor("abcde", "abcde", "Беларусь")}");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка {ex.Message}");
            }
        }

        private void GetIdButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MessageBox.Show($"Добавлен {DataAccessLayer.GetId("abcd", "abcd", "Беларусь")} автор");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка {ex.Message}");
            }
        }

        private void GetBooksButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var result = DataAccessLayer.GetBooks(0, 2000);
                dataGrid.ItemsSource = result.DefaultView;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка {ex.Message}");
            }
        }
    }
}