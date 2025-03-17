using System.Net;
using System.Net.Sockets;
using System.Text;

internal class Program
{
    private static string filepath = @"C:\Temp\ispp35\СП\logins.txt";
    private static Dictionary<string, string> logins = new Dictionary<string, string>();

    private static void Main(string[] args)
    {
        LoadCredentials();
        Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

        IPEndPoint localEndPoint = new(IPAddress.Any, 5000);
        socket.Bind(localEndPoint);
        socket.Listen(10);
        Console.WriteLine("Сервер запущен");
        Socket handler = socket.Accept();
        byte[] buffer = new byte[1024];
        string login = AuthenticateClient(handler);
        if (login == null)
        {
            Console.WriteLine("Неудачная аутентификация");
            handler.Shutdown(SocketShutdown.Both);
            handler.Close();
            return;
        }
        while (true)
        {                       
            int bytesReceived = handler.Receive(buffer);
            string data = Encoding.UTF8.GetString(buffer, 0, bytesReceived);
            data.Replace("<EOF>", "");
            if(data.ToLower() == "end")
            {
                Console.WriteLine("Пользователь завершил сеанс");
                break;
            }
            Console.WriteLine($"Получено сообщение: {data} в {DateTime.Now}");
            byte[] responseBuffer = Encoding.UTF8.GetBytes("Сообщение получено");
            handler.Send(responseBuffer);            
        }
        handler.Shutdown(SocketShutdown.Both);
        handler.Close();
    }

    private static string AuthenticateClient(Socket handler)
    {
        byte[] buffer = new byte[1024];
        string receivedData = "";
        try
        {
            int bytesReceived = handler.Receive(buffer);
            receivedData = Encoding.UTF8.GetString(buffer, 0, bytesReceived);
            string login = receivedData.Replace("<EOF>", "");

            bytesReceived = handler.Receive(buffer);
            receivedData = Encoding.UTF8.GetString(buffer, 0, bytesReceived);
            string password = receivedData.Replace("<EOF>", "");
            if(logins.ContainsKey(login) && logins[login] == password)
            {
                byte[] message = Encoding.UTF8.GetBytes("Успешный вход");
                handler.Send(message);
                return login;
            }
            else
            {
                byte[] message = Encoding.UTF8.GetBytes("Неверный логин или пароль.");
                handler.Send(message);
                return null;
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Ошибка: {ex.InnerException.Message}");
            return null;
        }
        
    }

    private static void LoadCredentials()
    {
        if (File.Exists(filepath))
        {
            string[] lines = File.ReadAllLines(filepath);
            foreach (var line in lines)
            {
                string[] parts = line.Split(';');
                if(parts.Length == 2)
                {
                    string login = parts[0].Trim();
                    string password = parts[1].Trim();
                    logins[login] = password;
                }                    
            }
        }
    }
}