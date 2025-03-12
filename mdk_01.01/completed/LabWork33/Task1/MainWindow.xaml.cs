using System.Windows;

namespace Task1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        List<Game> games =
        [
         new Game{IdGame = 1, Name = "Tetris", Category = "головоломка", Price = 150, Site = "abc"},
         new Game{IdGame = 2, Name = "Flappy Bird", Category = "платформер", Price = 10, Site = "abc"},
         new Game{IdGame = 3, Name = "Pac-man", Category = "аркада", Price = 300, Site = "abc"},
         new Game{IdGame = 4, Name = "Arkanoid", Category = "аркада", Price = 400, Site = "abc"},
         new Game{IdGame = 5, Name = "Mario", Category = "платформер", Price = 1000, Site = "abc"},
        ];

        public MainWindow()
        {
            InitializeComponent();

            gamesListView.ItemsSource = games;
        }
    }
}