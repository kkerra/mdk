using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    internal class User
    {
        public int Id { get; set; }
        public static User operator ++(User user1)
            => new User { Id = user1.Id + 1};

        public static User operator +(User user1, User user2)
            => new User { Id = user1.Id + user2.Id };

        public static bool operator >(User user1, User user2)
            => user1.Id > user2.Id;

        public static bool operator <(User user1, User user2)
            => user1.Id < user2.Id;

        public static bool operator true(User user)
            => user.Id > 0;

        public static bool operator false(User user)
            => user.Id <= 0;
    }
}
