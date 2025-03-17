using System;
using System.Diagnostics;
using System.Linq;

namespace ProcessLibrary
{
    public class TaskList
    {
        /// <summary>
        /// Отображает все запущенные процессы
        /// </summary>
        public static void ListAllProccesses()
        {
            Process[] processes = Process.GetProcesses();
            Console.WriteLine("Запущенные процессы:");
            foreach (Process process in processes)
                Console.WriteLine($"Имя: {process.ProcessName}");
        }

        /// <summary>
        /// Находит процесс с наибольшим id
        /// </summary>
        public static void FindProccessWithMaxId()
        {
            Process[] processes = Process.GetProcesses();
            var process = processes.OrderByDescending(p => p.Id).FirstOrDefault();
            Console.WriteLine($"Процесс с наибольшим id: {process.ProcessName}");
        }

        /// <summary>
        /// Возвращает информацию о процессе по имени
        /// </summary>
        /// <param name="name">название процесса</param>
        public static void GetProcessInfoByName(string name)
        {
            Process[] processes = Process.GetProcessesByName(name);
            if (processes.Length == 0)
            {
                Console.WriteLine("процесс с таким именем не найден");
                return;
            }

            Console.WriteLine("Информация о процессе:");
            foreach (Process process in processes)
            {
                try
                {
                    Console.WriteLine($"Имя: {process.ProcessName}");
                    Console.WriteLine($"Id: {process.Id}");
                    Console.WriteLine($"Память(кб): {process.WorkingSet64 / 1024}");
                }
                catch(Exception ex)
                {
                    Console.WriteLine($"Ошибка: {ex.InnerException.Message}");
                }
            }
        }

        /// <summary>
        /// запускает новый процесс
        /// </summary>
        /// <param name="filePath">путь к процессу</param>
        public static void StartNewProcess(string filePath)
        {
            try
            {
                Process.Start(filePath);
                Console.WriteLine("Процесс запущен");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка: {ex.InnerException.Message}");
            }
        }
    }
}
