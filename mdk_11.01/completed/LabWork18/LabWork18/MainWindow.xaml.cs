using DatabaseLibrary.Models;
using DatabaseLibrary.Services;
using System.Windows;

namespace LabWork18
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
            LoadMoviesAsync();
        }

        private async Task LoadMoviesAsync()
        {
            try
            {
                MoviesDataGrid.ItemsSource = _service.GetMovies();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private async void AddButton_ClickAsync(object sender, RoutedEventArgs e)
        {
            MovieWindow window = new();
            window.ShowDialog();
            await LoadMoviesAsync();
        }

        private async void RemoveButton_ClickAsync(object sender, RoutedEventArgs e)
        {
            var selectedMovies = new List<Movie>(MoviesDataGrid.SelectedItems.Cast<Movie>());
            var answer = MessageBox.Show($"Вы точно хотите удалить {selectedMovies.Count} записей?", "удаление",
                MessageBoxButton.YesNo, MessageBoxImage.Question);

            if (answer != MessageBoxResult.Yes)
                return;

            try
            {
                foreach (Movie movie in selectedMovies)
                {
                    await _service.RemoveMovieAsync(movie);
                    MessageBox.Show("Данные успешно удалены", "Информация", MessageBoxButton.OK,
                        MessageBoxImage.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Не удалось найти записи. {ex.InnerException.Message}", "Ошибка", MessageBoxButton.OK);
            }

            await LoadMoviesAsync();
        }

        private async void MoviesDataGrid_MouseDoubleClickAsync(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            if (MoviesDataGrid.SelectedItem is Movie movie)
            {
                MovieWindow window = new(movie);
                window.ShowDialog();
                await LoadMoviesAsync();
            }
        }
    }
}