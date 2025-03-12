using Microsoft.Win32;
using System.Windows;

namespace Lection06._05
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            //SaveFileDialog dialog = new SaveFileDialog();
            //if (dialog.ShowDialog().Value != true)
            //    return;
            //Title = dialog.SafeFileName;

            
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            //if (MessageBox.Show("Вы уверены, что хотите закрыть окно?",
            //    "Закрытие",
            //    MessageBoxButton.YesNo,
            //    MessageBoxImage.Question) != MessageBoxResult.Yes)
            //{
            //    e.Cancel = true;
            //}
            MyDialog window = new()
            {
                Owner = this,
                WindowStartupLocation = WindowStartupLocation.CenterScreen,
                WindowState = WindowState.Maximized
            };
            if (window.ShowDialog().Value != true)
                return;
            MessageBox.Show(window.Data);
        }
    }
}