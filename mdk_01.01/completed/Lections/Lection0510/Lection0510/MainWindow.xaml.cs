using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace Lection0510
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            Button clearButton = new();
            clearButton.Content = "Clear";
            clearButton.Click += ClearButton_Click;
            panel.Children.Add(clearButton);

        }

        private void ClearButton_Click(object sender, RoutedEventArgs e)
        {
            numberTextBox.Clear();
        }

        private void NumberButton_Click(object sender, RoutedEventArgs e)
        {
            var button = e.Source as Button;
            numberTextBox.Text += button.Content;
        }

        private void NumberTextBox_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)
        {

        }

        private void NumberTextBox_KeyUp(object sender, System.Windows.Input.KeyEventArgs e)
        {
            infoLabel.Content = e.Key.ToString();
            //if(e.Key == System.Windows.Input.Key.Down)
            //{

            //}
            //if(e.KeyboardDevice.Modifiers == System.Windows.Input.ModifierKeys.Control) { }
        }

        private void NumberTextBox_PreviewKeyDown(object sender, System.Windows.Input.KeyEventArgs e)
        {
            if (e.Key == Key.Space)
                e.Handled = true;
            else if(e.Key == Key.Decimal && numberTextBox.Text.Contains("."))
                e.Handled= true;

        }

        private void NumberTextBox_PreviewTextInput(object sender, System.Windows.Input.TextCompositionEventArgs e)
        {
            if(!Int32.TryParse(e.Text, out int number) && numberTextBox.Text.Contains("-"))
                e.Handled = true;
        }

        private void Window_MouseWheel(object sender, MouseWheelEventArgs e)
        {
            ;
        }

        private void Window_MouseMove(object sender, MouseEventArgs e)
        {

        }
    }
}