using System.Diagnostics;

namespace ProccessLibrary
{
    public class TaskList
    {
        public static void ListAllProccesses()
        {
            Process[] processes = Process.GetProcesses();
            Console.WriteLine("Запущенные процессы:");
            foreach (Process process in processes)
                Console.WriteLine($"Имя: {process.ProcessName}");
        }

        public static Process FindProccessWithMaxId()
        {
            Process[] processes = Process.GetProcesses();
            return processes.OrderByDescending(p => p.Id).FirstOrDefault();
        }

        public static Process GetProcessInfoByName(string name)
        {
            Process[] processes = Process.GetProcessesByName(name);
            if(processes.Length == 0)
                Console.WriteLine("процесс с таким именем не найден");

        }
    }
}
