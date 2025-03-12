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
    /// Логика взаимодействия для PlaceholderTextBox.xaml
    /// </summary>
    public partial class PlaceholderTextBox : UserControl
    {
        public string Text { get; set; }

        public PlaceholderTextBox()
        {
            InitializeComponent();
            DataContext = this;
        }

        private void ContentTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if(ContentTextBox.Text.Length > 0) 
                HintTextBox.Visibility = Visibility.Hidden;
            else
                HintTextBox.Visibility = Visibility.Visible;
        }
    }
}
