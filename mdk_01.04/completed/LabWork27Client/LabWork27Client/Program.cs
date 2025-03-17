using System.Net;
using System.Net.Sockets;
using System.Text;

internal class Program
{
    private static void Main(string[] args)
    {
        Socket clientSocket = new(SocketType.Stream, ProtocolType.Tcp);
        IPEndPoint serverEndPoint = new IPEndPoint(IPAddress.Loopback, 5000);
        clientSocket.Connect(serverEndPoint);
        if (!Authenticate(clientSocket))
        {
            Console.WriteLine("Аутентификация не удалась.");
            return;
        }
        while (true)
        {
            Console.WriteLine("Введите сообщение для отправки на сервер. Для окончания введите end:");
            string message = Console.ReadLine();
            if (message.ToLower() == "end")
            {
                break;
            }
            byte[] sendBuffer = Encoding.UTF8.GetBytes(message);
            clientSocket.Send(sendBuffer);

            byte[] receiveBuffer = new byte[1024];
            int bytesReceived = clientSocket.Receive(receiveBuffer);
            string response = Encoding.UTF8.GetString(receiveBuffer, 0, bytesReceived);
            Console.WriteLine($"Ответ от сервера: {response}");
        }
        clientSocket.Shutdown(SocketShutdown.Both);
        clientSocket.Close();
    }

    private static bool Authenticate(Socket clientSocket)
    {
        Console.WriteLine("Введите логин:");
        string login = Console.ReadLine();

        Console.WriteLine("Введите пароль:");
        string password = Console.ReadLine();

        byte[] loginBytes = Encoding.UTF8.GetBytes(login);
        clientSocket.Send(loginBytes);
        byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
        clientSocket.Send(passwordBytes);

        byte[] buffer = new byte[1024];
        int bytesReceive = clientSocket.Receive(buffer);
        string response = Encoding.UTF8.GetString(buffer, 0, bytesReceive);
        return response.Contains("Успешный вход");
    }
}