using System.Windows;
using System.Windows.Media;

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

        private void OpenColorButton_Click(object sender, RoutedEventArgs e)
        {
            ColorWindow colorWindow = new();
            if (colorWindow.ShowDialog() == true)
                Background = new SolidColorBrush(Color.FromRgb((byte)colorWindow.Red, (byte)colorWindow.Green, (byte)colorWindow.Blue));


        }
    }
}