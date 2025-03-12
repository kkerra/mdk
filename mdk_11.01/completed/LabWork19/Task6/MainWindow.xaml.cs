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

namespace Task6
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        AppDbContext _context;

        public MainWindow()
        {
            InitializeComponent();
            showTicketsButton.Click += ShowTicketsButton_Click;
            _context = new AppDbContext();
        }

        private void ShowTicketsButton_Click(object sender, RoutedEventArgs e)
        {
            var tickets = _context.Database.SqlQuery<string>($"SELECT dbo.GetTicketByPhone({phoneTextBox.Text})").ToList();
            ticketDataGrid.ItemsSource = tickets;
        }
    }
}