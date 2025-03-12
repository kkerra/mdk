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

        private void GetBookButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MessageBox.Show($"Количество книг с ценой меньше: {DataAccessLayer.GetAmountBook(1000)}");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}");
            }
        }

        private void GetIdButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                DataAccessLayer.GetId(@"INSERT INTO Author(surname, name, country)
                                        VALUES('abcв', 'abcв', 'Франция')");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}");
            }
        }

        private void GetBooksButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var result = DataAccessLayer.GetBooks(1000, "проза");
                dataGrid.ItemsSource = result.DefaultView;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}");
            }
        }

        private void UpdateDataButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MessageBox.Show($"Изменено: {DataAccessLayer.UpdateBook(10, 200, "стихи")}");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}");
            }
            
        }
    }
}