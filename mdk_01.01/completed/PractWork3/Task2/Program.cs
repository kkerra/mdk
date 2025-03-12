using Word = Microsoft.Office.Interop.Word;

Console.WriteLine("Введите количество заданий");
int task = Convert.ToInt32(Console.ReadLine());

var app = new Word.Application
{
    Visible = true
};

var document = app.Documents.Add();
var paragraph =  document.Paragraphs.Add();
paragraph.Range.Text = "Таблица 1 - Задания";
paragraph.Range.InsertParagraphAfter();
var range =  paragraph.Range;
var table = document.Tables.Add(range, task + 1, 2);
for (int i = 1; i <= task + 1; i++)
{
    table.Cell(i, 1).Range.Text = $"Задание {i}";
    table.Cell(i, 2).Range.Text = $"Задание";

}