using System.Windows;
using System.Windows.Controls;

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

        private void SizeRadioButton_Checked(object sender, RoutedEventArgs e)
        {
            RadioButton radioButton = (RadioButton)sender;
            if (int.TryParse(radioButton.Content.ToString(), out int fontSize))
            {
                inputTextBox.FontSize = fontSize;
            }            
        }

        private void LeftAlignmentRadioButton_Checked(object sender, RoutedEventArgs e)
        {
            inputTextBox.TextAlignment = TextAlignment.Left;
        }

        private void RightAlignmentRadioButton_Checked(object sender, RoutedEventArgs e)
        {
            inputTextBox.TextAlignment = TextAlignment.Right;
        }

        private void CenterAlignmentRadioButton_Checked(object sender, RoutedEventArgs e)
        {
            inputTextBox.TextAlignment = TextAlignment.Center;
        }
    }
}