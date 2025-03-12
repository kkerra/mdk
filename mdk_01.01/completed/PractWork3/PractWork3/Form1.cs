using Word = Microsoft.Office.Interop.Word;
namespace PractWork3
{
    public partial class Form1 : Form
    {
        SaveFileDialog saveFileDialog = new()
        {
            Filter = "Word Document(*.docx) | *.docx | PDF Document(*.pdf) | *.pdf"
        };

        public Form1()
        {
            InitializeComponent();
        }

        private void CreateDocumentButton_Click(object sender, EventArgs e)
        {
            var app = new Word.Application
            {
                Visible = true
            };


            var document = app.Documents.Add();
            string text = inputTextBox.Text;            
            var paragraph = document.Paragraphs.Add();            
            paragraph.Range.Font.Name = "Times New Roman";
            paragraph.Range.Font.Size = 14;
            paragraph.Alignment = Word.WdParagraphAlignment.wdAlignParagraphJustify;
            paragraph.Range.Text = text;
            document.Content.Text = text;
            document.Range().InsertParagraphAfter();
            document.Range().InsertAfter(DateTime.Now.ToString());

            //Word.InlineShape imageShape = document.InlineShapes.AddPicture("thesims4.png");
            //imageShape.Height = 50;
            //imageShape.Width = 50;
            //imageShape.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;

            if (saveFileDialog.ShowDialog() == DialogResult.OK)
            {
                string filename = saveFileDialog.FileName;
                if (filename.EndsWith(".docx"))
                {
                    document.SaveAs(filename, Word.WdSaveFormat.wdFormatDocumentDefault);
                }
                else
                {
                    document.SaveAs(filename, Word.WdSaveFormat.wdFormatPDF);
                }
            }
        }
    }
}
