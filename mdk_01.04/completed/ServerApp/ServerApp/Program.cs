using System.IO.Pipes;

internal class Program
{
    private static void Main(string[] args)
    {
        NamedPipeServerStream server = new NamedPipeServerStream("myPipe");
        server.WaitForConnection();

        byte[] numberBytes = new byte[4];
        int numberBytesRead = server.Read(numberBytes, 0, numberBytes.Length);
        int number = BitConverter.ToInt32(numberBytes, 0);
        Console.WriteLine($"Получено число: {number}");

        long factorial = CalculateFactorial(number);

        byte[] bytes = BitConverter.GetBytes(factorial);
        server.Write(bytes, 0, bytes.Length);
        server.Flush();

        Console.WriteLine($"Факториал: {factorial}");
        server.Close();
    }

    private static long CalculateFactorial(int number)
    {
        long result = 1;
        for(int i = 2;  i <= number; i++)
        {
            result *= i;
        }
        return result;
    }
}