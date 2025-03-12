using System.Data;
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

        private void EditTableDataButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MessageBox.Show($"Изменено: {DataAccessLayer.EditTableData(queryTextBox.Text)} строк");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}");
            }
        }

        private void UpdatePriceButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MessageBox.Show($"Изменено: {DataAccessLayer.UpdatePrice(1, 200)}");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}");
            }
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                var result = DataAccessLayer.GetDataTable("Book");
                dataGrid.ItemsSource = result.DefaultView;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}");
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                DataTable table = new();
                DataAccessLayer.EditTable(ref table, "Book");

                MessageBox.Show("Данные сохранены");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}");
            }
        }
    }
}