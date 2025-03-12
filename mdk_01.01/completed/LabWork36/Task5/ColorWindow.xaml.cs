using System.Windows;

namespace Task5
{
    /// <summary>
    /// Логика взаимодействия для ColorWindow.xaml
    /// </summary>
    public partial class ColorWindow : Window
    {
        public ColorWindow()
        {
            InitializeComponent();
        }

        private void YesButton_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = true;
        }

        public double Red => redSlider.Value;
        public double Green => greenSlider.Value;
        public double Blue => blueSlider.Value;
    }
}
