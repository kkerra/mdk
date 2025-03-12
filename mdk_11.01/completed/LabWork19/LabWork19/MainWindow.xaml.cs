using DatabaseLibrary.Data;
using Microsoft.EntityFrameworkCore;
using System.Windows;

namespace Task1
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
            _context = new AppDbContext();
        }

        private void LoadMovies()
        {
            var movies = _context.Movies.FromSqlRaw($"SELECT * FROM Movie ORDER BY {sortColumnTextBox.Text}").ToList();
            moviesDataGrid.ItemsSource = movies;
        }

        private void SortButton_Click(object sender, RoutedEventArgs e)
        {
            LoadMovies();
        }
    }
}