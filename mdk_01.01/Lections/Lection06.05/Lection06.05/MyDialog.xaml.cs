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
using System.Windows.Shapes;

namespace Lection06._05
{
    /// <summary>
    /// Логика взаимодействия для MyDialog.xaml
    /// </summary>
    public partial class MyDialog : Window
    {
        public MyDialog()
        {
            InitializeComponent();
        }

        private void YesButton_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = true;
        }

        public string Data => "test data";
    }
}
