using DatabaseLibrary.Data;
using Microsoft.EntityFrameworkCore;
using System.Windows;

namespace Task2
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

        private void SelectMovies()
        {
            //var movies = _context.Movies.FromSqlRaw("SELECT * FROM Movie WHERE Title LIKE '%' + {0} + '%' AND ReleaseYear >= {1}", 
            //    titleTextBox.Text, releaseYearTextBox.Text).ToList();
            var movies2 = _context.Movies.FromSql($"SELECT * FROM Movie WHERE Title LIKE '%' + {titleTextBox.Text} + '%' AND ReleaseYear >= {releaseYearTextBox.Text}");
            moviesDataGrid.ItemsSource = movies2.ToList();
        }

        private void ShowButton_Click(object sender, RoutedEventArgs e)
        {
            SelectMovies();
        }
    }
}