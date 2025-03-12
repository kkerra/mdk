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

namespace Task4
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
            showDateButton.Click += ShowDateButton_Click;
            _context = new AppDbContext();
        }

        private void GetDateByTicketId()
        {
            var dateTime = _context.Database.SqlQuery<DateTime>($"SELECT dbo.GetDateTimeByTicketId({ticketIdTextBox.Text}) AS value")
                .FirstOrDefault();
            MessageBox.Show($"Дата киносеанса: {dateTime}");
        }

        private void ShowDateButton_Click(object sender, RoutedEventArgs e)
        {
            GetDateByTicketId();
        }
    }
}