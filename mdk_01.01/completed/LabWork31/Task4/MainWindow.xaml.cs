using System.Windows;

namespace Task4
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

        private void Slider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            resultLabel.Content = $"Результат: {Math.Round(priceSlider.Value / 100 * percentSlider.Value, 2)}";

            resultTextBlock.Text = $"Результат: {Math.Round(priceSlider.Value / 100 * percentSlider.Value, 2)}";
            percentTextBlock.Text = $"Проценты: {Math.Round(percentSlider.Value, 2)} %";
            sumTextBlock.Text = $"Сумма: {Math.Round(priceSlider.Value, 2)}";
        }
    }
}