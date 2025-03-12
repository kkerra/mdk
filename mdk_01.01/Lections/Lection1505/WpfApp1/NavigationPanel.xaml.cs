using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
    /// Логика взаимодействия для NavigationPanel.xaml
    /// </summary>
    public partial class NavigationPanel : UserControl
    {
        public event RoutedEventHandler? GoPrevious;
        public event RoutedEventHandler? GoNext;

        public int CurrentPage
        {
            get { return (int)GetValue(CurrentPageProperty); }
            set 
            { 
                SetValue(CurrentPageProperty, value);
                PageTextBox.Text = CurrentPage.ToString();
            }
        }

        // Using a DependencyProperty as the backing store for CurrentPage.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty CurrentPageProperty =
            DependencyProperty.Register("CurrentPage", typeof(int), typeof(NavigationPanel), new PropertyMetadata(0));



        public NavigationPanel()
        {
            InitializeComponent();

            DataContext = this;
        }

        private void NextButton_Click(object sender, RoutedEventArgs e)
        {
            GoNext?.Invoke(this, e);
            CurrentPage++;
        }

        private void PrevButton_Click(object sender, RoutedEventArgs e)
        {
            GoPrevious?.Invoke(this, e);
            CurrentPage--;
        }
    }
}
