using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Windows;

namespace WpfApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private readonly HttpClient _client;

        public MainWindow()
        {
            InitializeComponent();

            _client = new() { BaseAddress = new Uri("http://localhost:5157/api/") };
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            await LoadDataAsync();
        }

        private async Task LoadDataAsync()
        {
            var categories = await _client.GetFromJsonAsync<List<Category>>("Categories");
            grid.ItemsSource = categories;
        }

        private async void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var category = grid.SelectedItem as Category;
                var response = await _client.DeleteAsync($"Categories/{category.CategoryId}");
                response.EnsureSuccessStatusCode();
                await LoadDataAsync();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private async void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            var response = await _client.PostAsJsonAsync("Account", 
                new User() 
                { 
                    Login = "admin", Password = "qwerty" 
                });
            response.EnsureSuccessStatusCode();

            var token = await response.Content.ReadAsStringAsync();
            MessageBox.Show(token);
            _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
        }
    }
}