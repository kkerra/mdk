using System.Text;
using System.Windows;
using WpfCrudApp.Models;
using WpfCrudApp.Services;

namespace WpfCrudApp
{
    /// <summary>
    /// Логика взаимодействия для GameWindow.xaml
    /// </summary>
    public partial class GameWindow : Window
    {
        private readonly GameService _service = new();
        private Game _game;

        public GameWindow(Game? game = null)
        {
            InitializeComponent();

            _game = game ?? new Game();
            DataContext = _game;
            LoadCategoriesAsync();
        }

        private async Task LoadCategoriesAsync()
        {
            try
            {
                CategoriesComboBox.ItemsSource = await _service.GetAllCategoriesAsync();
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
                StringBuilder error = new();

                if (CategoriesComboBox.SelectedItem == null)
                    error.AppendLine("надо выбрать категорию");

                if (String.IsNullOrWhiteSpace(_game.Name))
                    error.AppendLine("надо указать название");

                if (_game.Price < 0 || _game.Price > 5000)
                    error.AppendLine("надо указать цену от 0 до 5000");

                if (error.Length > 0)
                {
                    MessageBox.Show(error.ToString());
                    return;
                }

                if (_game.GameId == 0)
                    await _service.AddGameAsync(_game);
                else
                {
                    _game.Category = null;
                    await _service.UpdateGameAsync(_game);
                }
                DialogResult = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
    }
}
