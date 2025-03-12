using DomainLayer;
using System.Net.Http;
using System.Windows;

namespace PractWork2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        MovieService _service = new();

        public MainWindow()
        {
            InitializeComponent();
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            await LoadMovieAsync();
        }

        private async Task LoadMovieAsync()
        {
            var movies = await _service.GetMoviesAsync();
            moviesDataGrid.ItemsSource = movies;
        }

        private async void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var movie = moviesDataGrid.SelectedItem as Movie;
                if (movie != null)
                {
                    var response = await _service.DeleteMovieAsync(movie.MovieId);
                    MessageBox.Show($"Запись успешно удалена. Код: {(int)response.StatusCode}");
                }
                await LoadMovieAsync();
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private async void UpdateButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var movie = moviesDataGrid.SelectedItem as Movie;
                if (movie != null)
                {
                    movie.Title = TitleTextBox.Text;
                    await _service.UpdateMovieAsync(movie);
                    MessageBox.Show($"Данные успешно обновлены.");
                }
                await LoadMovieAsync();
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show($"{ex.InnerException.Message}");
            }
        }

        private async void AddButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var movie = new Movie()
                {
                    Title = TitleTextBox.Text,
                    Duration = Convert.ToInt16(DurationTextBox.Text),
                    ReleaseYear = Convert.ToInt16(ReleaseYearTextBox.Text),
                    Description = DescriptionTextBox.Text,
                    AgeRating = AgeRatingTextBox.Text,
                };
                var response = await _service.AddMovieAsync(movie);
                await LoadMovieAsync();
                MessageBox.Show($"Данные успешно добавлены. Адрес {response}");
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show($"{ex.InnerException.Message}");
            }
        }

        private void GetByIdButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var movie = moviesDataGrid.SelectedItem as Movie;
                if (movie != null)
                {
                    TitleTextBox.Text = movie.Title;
                    DurationTextBox.Text = movie.Duration.ToString();
                    ReleaseYearTextBox.Text = movie.ReleaseYear.ToString();
                    DescriptionTextBox.Text = movie.Description;
                    AgeRatingTextBox.Text = movie.AgeRating;
                }
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show($"{ex.InnerException.Message}");
            }
        }
    }
}