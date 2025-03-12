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

namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            var bitmap = new BitmapImage(new Uri("galaxy.jpg", UriKind.RelativeOrAbsolute));
            FormatConvertedBitmap converter = new(bitmap, PixelFormats.BlackWhite, null, 0);
            image.Source = converter;

            canvas.DefaultDrawingAttributes.Width = 10;
            canvas.DefaultDrawingAttributes.Color = Colors.Aqua;
            canvas.DefaultDrawingAttributes.StylusTip = System.Windows.Ink.StylusTip.Ellipse;

        }

        private void NavigationPanel_GoNext(object sender, RoutedEventArgs e)
        {
            //MessageBox.Show("next");
        }

        private void NavigationPanel_GoPrevious(object sender, RoutedEventArgs e)
        {
            //MessageBox.Show("previous");
        }
    }
}