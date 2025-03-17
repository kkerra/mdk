using System.IO.Pipes;
using System.Text;

NamedPipeClientStream client = new NamedPipeClientStream(".", "myPipe", PipeDirection.InOut);
client.Connect();

Console.WriteLine("Введите число для вычисления факториала:");
string input = Console.ReadLine();
if(!int.TryParse(input, out int number))
{
    Console.WriteLine("Некорректный ввод");
    return;
}
byte[] numberBytes = BitConverter.GetBytes(number);
client.Write(numberBytes, 0, numberBytes.Length);
client.Flush();

byte[] factorialBytes = new byte[8];
int factorialBytesRead = client.Read(factorialBytes, 0, factorialBytes.Length);
long factorial = BitConverter.ToInt64(factorialBytes, 0);
Console.WriteLine($"Факториал числа: {factorial}");