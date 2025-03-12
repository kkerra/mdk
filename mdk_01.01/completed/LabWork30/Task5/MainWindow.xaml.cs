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

namespace Task5
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

        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {
            Color color = Color.FromRgb(
                (byte)(redCheckBox.IsChecked == true ? redSlider.Value : 0),
                (byte)(greenCheckBox.IsChecked == true ? greenSlider.Value : 0),
                (byte)(blueCheckBox.IsChecked == true ? blueSlider.Value : 0)
                );
            Background = new SolidColorBrush(color);
        }

        private void Slider_ValueChange(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            Color color = Color.FromRgb(
                (byte)(redCheckBox.IsChecked == true ? redSlider.Value : 0),
                (byte)(greenCheckBox.IsChecked == true ? greenSlider.Value : 0),
                (byte)(blueCheckBox.IsChecked == true ? blueSlider.Value : 0)
                );
            Background = new SolidColorBrush(color);
        }
    }
}