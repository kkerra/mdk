using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Task3
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

        private void PriceTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            priceLabel.Content = $"Цена: {productCounter.Value * Int32.Parse(priceTextBox.Text)}";
        }

        private void ProductCounter_ValueChanged(object sender, RoutedEventArgs e)
        {
            priceLabel.Content = $"Цена: {productCounter.Value * Int32.Parse(priceTextBox.Text)}";
        }
    }
}