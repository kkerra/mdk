using System.IO;
using System.Windows;
using Excel = Microsoft.Office.Interop.Excel;

namespace LabWork23
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private SessionService _service = new();

        public MainWindow()
        {
            InitializeComponent();
        }

        private async void SaveCsvButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var sessions = await _service.GetAllByCinemaAsync(SessionDatePicker.SelectedDate.Value, CinemaTextBox.Text);
                var filePath = "movieSchedule.csv";
                using var writer = new StreamWriter(filePath);
                writer.WriteLine("Title;Start;Hall;Price");
                foreach (var session in sessions)
                {
                    writer.WriteLine($"{session.MovieTitle}; {session.Start}; {session.HallNumber}; {session.Price}");
                }
                MessageBox.Show("Данные сохранены");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.InnerException.Message);
                throw;
            }
        }

        private async void SaveXlsxButton_Click(object sender, RoutedEventArgs e)
        {
            var sessions = await _service.GetAllByCinemaAsync(SessionDatePicker.SelectedDate.Value, CinemaTextBox.Text);
            var excelApp = new Excel.Application
            {
                Visible = true
            };
            var workbook = excelApp.Workbooks.Add();
            foreach (var session in sessions)
            {
                var worksheet = workbook.Worksheets.Add();
                worksheet.Name = session.Cinema;
                worksheet.Cells[1, 1] = "Название фильма";
                worksheet.Cells[2, 1] = "Время";
                worksheet.Cells[3, 1] = "Зал";
                worksheet.Cells[4, 1] = "Цена";

                int row = 2;
            }
        }
    }
}