using LabWork20.Services;
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

namespace LabWork20
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private readonly MovieService _service = new();

        public MainWindow()
        {
            InitializeComponent();
            LoadMovies();
        }

        private async Task LoadMovies()
        {
            try
            {
                MoviesDataGrid.ItemsSource = await _service.GetMoviesAsync();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            LoginWindow window = new();
            window.ShowDialog();
        }
    }
}