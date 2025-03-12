using DomainLayer;
using System.Windows;

namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        CategoryService _service = new();

        public MainWindow()
        {
            InitializeComponent();

        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            await LoadCategoriesAsync();
        }

        private async Task LoadCategoriesAsync()
        {
            var categories = await _service.GetCategoriesAsync();
            CategoriesDataGrid.ItemsSource = categories;
        }

        private async void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            var category = CategoriesDataGrid.SelectedItem as Category;
            if (category != null)
                await _service.DeleteCategoryAsync(category.CategoryId);
            await LoadCategoriesAsync();
        }

        private async void UpdateButton_Click(object sender, RoutedEventArgs e)
        {
            var category = CategoriesDataGrid.SelectedItem as Category;
            if (category != null)
            {
                category.Name = NameTextBox.Text;
                await _service.UpdateCategoryAsync(category);
            }
            await LoadCategoriesAsync();
        }

        private async void AddButton_Click(object sender, RoutedEventArgs e)
        {
            var category = new Category()
            {
                Name = NameTextBox.Text,
            };
            await _service.AddCategoryAsync(category);
            await LoadCategoriesAsync();
        }
    }
}