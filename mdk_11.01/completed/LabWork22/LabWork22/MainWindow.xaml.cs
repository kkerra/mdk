using LabWork22.Services;
using System.IO;
using System.Windows;
using word = Microsoft.Office.Interop.Word;

namespace LabWork22
{
    public partial class MainWindow : Window
    {
        private readonly TicketService ticketService = new();

        public MainWindow()
        {
            InitializeComponent();
        }

        private void SaveToTxtButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var ticket = ticketService.GetTicketById(Convert.ToInt32(TicketTextBox.Text));
                if (ticket == null)
                    MessageBox.Show("Билет не найден");
                string ticketInfo = $"Билет № {ticket.TicketId}\r\n{ticket.Session.Movie.Title}\r\nНачало сеанса: {ticket.Session.DateTime}\r\nКинотеатр: {ticket.Session.Hall.Cinema}\r\nЗал: {ticket.Session.Hall.HallNumber}\r\nРяд: {ticket.Row} Место: {ticket.Place}";

                File.WriteAllText($"{ticket.TicketId}.txt", ticketInfo);
                MessageBox.Show("Успешно сохранено");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.InnerException.Message}");
            }
        }

        private void SaveToPdfButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var wordApp = new word.Application
                {
                    Visible = true
                };
                object template = Environment.CurrentDirectory + "\\Шаблон билета.docx";
                var document = wordApp.Documents.Add(template);
                var ticket = ticketService.GetTicketById(Convert.ToInt32(TicketTextBox.Text));
                if (ticket == null)
                    MessageBox.Show("Билет не найден");
                string ticketInfo = $"Билет № {ticket.TicketId}\r\n{ticket.Session.Movie.Title}\r\nНачало сеанса: {ticket.Session.DateTime}\r\nКинотеатр: {ticket.Session.Hall.Cinema}\r\nЗал: {ticket.Session.Hall.HallNumber}\r\nРяд: {ticket.Row} Место: {ticket.Place}";


                MessageBox.Show("Успешно сохранено");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.InnerException.Message}");
            }
        }
    }
}