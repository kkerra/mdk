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

        private void SubscriptionCheckBox_Click(object sender, RoutedEventArgs e)
        {
            if (subscriptionCheckBox.IsChecked == true)
            {
                subscribeButton.IsEnabled = true;
            }
            else
            {
                subscribeButton.IsEnabled = false;
            }
        }
    }
}