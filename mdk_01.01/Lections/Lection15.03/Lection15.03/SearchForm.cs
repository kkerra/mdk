using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lection15._03
{
    public partial class SearchForm : Form
    {
        //делегат
        public Action<string> Action;

        public SearchForm()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            //вызов метода делегата
            Action?.Invoke(textBox1.Text);
        }
    }
}
