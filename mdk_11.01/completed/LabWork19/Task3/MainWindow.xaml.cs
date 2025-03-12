using DatabaseLibrary.Data;
using Microsoft.EntityFrameworkCore;
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
        private AppDbContext _context;

        public MainWindow()
        {
            InitializeComponent();
            _context = new AppDbContext();
        }

        private void UpdatePrice()
        {
            var affectedRow = _context.Database.ExecuteSqlRaw("UPDATE Session SET Price = Price + {0} WHERE HallId = {1}", 
                priceTextBox.Text, hallTextBox.Text);
            affectedRow = _context.Database.ExecuteSqlRaw($"UPDATE Session SET Price = Price + {priceTextBox.Text} WHERE HallId = {hallTextBox.Text}");
            affectedRow = _context.Database.ExecuteSql($"$UPDATE Session SET Price = Price + {priceTextBox.Text} WHERE HallId = {hallTextBox.Text}");
            MessageBox.Show($"Изменено {affectedRow} строк");
        }

        private void UpdateButton_Click(object sender, RoutedEventArgs e)
        {
            UpdatePrice();
        }
    }
}