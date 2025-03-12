using DBLibrary;

//task1
Console.WriteLine($"Строка подключения: {DAL.ConnectionString}");

//task2
DAL.ChangeConnectionSettings(@"PRSERVER\SQLEXPRESS", "ispp3503", "ispp3503", "3503");
Console.WriteLine($"Строка подключения: {DAL.ConnectionString}");
Console.WriteLine(DAL.IsConnected());

//task3
Console.WriteLine(await DAL.ExecuteCommandAsync("UPDATE Movie SET Duration = 222"));

//task4
Console.WriteLine(await DAL.ExecuteScalarAsync("SELECT SUM(Price) FROM Session"));

//task5
await DAL.UpdatePriceAsync(1, 400);

//task6
await DAL.UploadPhotoAsync("абв", @"C:\temp\ispp35\images\plant.png");