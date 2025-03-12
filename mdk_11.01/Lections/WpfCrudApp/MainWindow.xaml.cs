using System.Windows;
using System.Windows.Input;
using WpfCrudApp.Models;
using WpfCrudApp.Services;

namespace WpfCrudApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private readonly GameService _service = new();

        public MainWindow()
        {
            InitializeComponent();
            LoadGames();
        }

        public async Task LoadGames()
        {
            try
            {
                GamesDataGrid.ItemsSource = await _service.GetAllGamesAsync();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private async void AddButton_Click(object sender, RoutedEventArgs e)
        {
            GameWindow window = new();
            window.ShowDialog();
            await LoadGames();
        }

        private async void RemoveButton_ClickAsync(object sender, RoutedEventArgs e)
        {
            var selectedGames = new List<Game>(GamesDataGrid.SelectedItems.Cast<Game>());

            foreach (Game game in selectedGames)
            {
                try
                {
                    await _service.RemoveGameAsync(game);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }

            await LoadGames();
        }

        private async void GamesDataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (GamesDataGrid.SelectedItem is Game game)
            {
                GameWindow window = new(game);
                window.ShowDialog();
                await LoadGames();
            }
        }
    }
}