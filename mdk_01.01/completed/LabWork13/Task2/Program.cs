using System.Text;

Console.WriteLine($"Введите строку:");
string text = Console.ReadLine();
string trimmedString = text.Trim();
string replacementSpacesString = 
    String.Join(" ", trimmedString.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries));
Console.WriteLine($"Строка после удаления и замены пробелов: {replacementSpacesString}");

Console.WriteLine($"Выберите регистр для изменения(нижний, верхний, инвертированный)");
string selectedRegister = Console.ReadLine();

string result = "";
switch (selectedRegister)
{
    case "верхний":
        result.Insert(0, text.ToUpper());
        break;
    case "нижний":
        result.Insert(0, text.ToLower());
        break;
    case "инвертированный":
        StringBuilder stringBuilder = new();
        for (int i = 0; i < text.Length; i++)
        {
            if (char.IsUpper(text[i]))
                stringBuilder.Append(char.ToLower(text[i]));
            else if (char.IsLower(text[i]))
                stringBuilder.Append(char.ToUpper(text[i]));
            else
                stringBuilder.Append(text[i]);
        }
        break;
}