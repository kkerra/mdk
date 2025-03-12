using Microsoft.Win32;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace Task1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        OpenFileDialog dialog = new();

        public MainWindow()
        {
            InitializeComponent();
        }

        private void LoadImageButton_Click(object sender, RoutedEventArgs e)
        {
            dialog.Filter = "Image|*.jpg;*.png";
            if (dialog.ShowDialog() != true)
                return;
            Image image = new();
            image.Source = new BitmapImage(new Uri(dialog.FileName));
            inkCanvas.Children.Add(image);
        }

        private void ColorsComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            string selectedColor = (colorsComboBox.SelectedItem as ComboBoxItem).Content.ToString();
            var currentColor = Colors.Black;
            switch (selectedColor)
            {
                case "Красный":
                    currentColor = Colors.Red;
                    break;
                case "Синий":
                    currentColor = Colors.Blue;
                    break;
                case "Зеленый":
                    currentColor = Colors.Green;
                    break;
            }
            inkCanvas.DefaultDrawingAttributes.Color = currentColor;
        }

        private void SizeSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            inkCanvas.DefaultDrawingAttributes.Width = sizeSlider.Value;
            inkCanvas.DefaultDrawingAttributes.Height = sizeSlider.Value;
        }
    }
}