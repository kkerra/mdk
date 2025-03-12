using DatabaseLibrary.Models;
using DatabaseLibrary.Services;
using System.Text;
using System.Windows;

namespace LabWork18
{
    /// <summary>
    /// Логика взаимодействия для MovieWindow.xaml
    /// </summary>
    public partial class MovieWindow : Window
    {
        private readonly MovieService _service = new();
        private Movie _movie;

        public MovieWindow(Movie? movie = null)
        {
            InitializeComponent();

            _movie = _movie ?? new Movie();
            DataContext = _movie;
            LoadRatings();
        }

        private void LoadRatings()
        {
            try
            {
                var ageRatings = _service.GetRatingsAsync();

                /*var ageRatings = _service.GetMovies().Select(m => m.AgeRating)
                                    .Distinct().ToList();*/
                ageRatings.Add("21+");
                ageRatings.Add("12+");
                AgeRatingComboBox.ItemsSource = ageRatings;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private async void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new();
                if (AgeRatingComboBox.SelectedItem == null)
                    errors.AppendLine("Нужно выбрать возрастное ограничение");

                if (String.IsNullOrWhiteSpace(_movie.Title))
                    errors.AppendLine("Нужно указать название");

                if (_movie.Duration < 0)
                    errors.AppendLine("Введите корректное значение продолжительности");

                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString());
                    return;
                }

                _movie.Title.Trim();
                if (!String.IsNullOrWhiteSpace(_movie.Description))
                    _movie.Description.Trim();

                if (_movie.MovieId == 0)
                {
                    await _service.AddMovieAsync(_movie);
                    MessageBox.Show("Данные успешно сохранены", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else
                {
                    await _service.UpdateMovieAsync(_movie);
                }
                DialogResult = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Не удалось сохранить запись. {ex.InnerException.Message}");
            }
        }
    }
}
