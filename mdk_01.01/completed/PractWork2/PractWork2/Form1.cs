using Excel = Microsoft.Office.Interop.Excel;
namespace PractWork2
{
    public partial class Form1 : Form
    {
        string loginsFile = "logins.csv";

        public Form1()
        {
            InitializeComponent();
        }

        private void RegistrationButton_Click(object sender, EventArgs e)
        {
            var app = new Excel.Application();

            string login = loginTextBox.Text;
            string password = passwordTextBox.Text;

            if (File.Exists(loginsFile))
            {
                string[] lines = File.ReadAllLines(loginsFile);
                string currendDate = DateTime.Now.ToString("dd/MM/yyyy");
                foreach (string line in lines)
                {
                    string[] parts = line.Split(';');
                    if (parts[0] == login)
                    {
                        MessageBox.Show("Пользователь с таким логином зарегистрирован. Повторно введите логин");
                    }
                    else
                    {
                        string userRecord = $"{login}; {password}; {currendDate}";
                        File.AppendAllText(loginsFile,userRecord + Environment.NewLine);
                        MessageBox.Show("Вы зарегистрированы");
                    }
                }
            }
        }
    }
}
