using ProcessLibrary;

TaskList.ListAllProccesses();
Console.WriteLine();

TaskList.FindProccessWithMaxId();
Console.WriteLine();

TaskList.GetProcessInfoByName("notepad");
Console.WriteLine();

TaskList.StartNewProcess("notepad.exe");