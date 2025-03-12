using ConsoleApp1;

Sandwich sandwich = new Sandwich();
Bread bread = new Bread { Weight = 110 };
sandwich = sandwich + bread;
Cheese cheese = new Cheese { Weight = 60   };
sandwich = sandwich + cheese;

User user1 = new User { Id = 12 };
User user2 = new User { Id = 28 };
User user3 = user1 + user2;
Console.WriteLine(user3.Id);

if(user1 < user2)
{
    Console.WriteLine("1 меньше");
}
else
{
    Console.WriteLine("2 меньше");
}
if (user1)
{
    Console.WriteLine("id > 0");
}
