using System.Windows;

namespace Task1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void ShowScalarButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var result = DataAccessLayer.GetValue(queryTextBox.Text);
                MessageBox.Show(result.ToString());
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка {ex.Message}");
            }
        }

        private void ShowTableButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var result = DataAccessLayer.GetValues(queryTextBox.Text);
                dataGrid.ItemsSource = result.DefaultView;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка {ex.Message}");
            }
        }

        private void ShowBooksButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                dataGrid.ItemsSource = DataAccessLayer.GetBooks();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка {ex.Message}");
            }
        }
    }
}