using LabWork20.Models;

namespace LabWork20
{
    public class UserSession
    {
        private static readonly UserSession _instance = new();

        public CinemaUser CurrentUser { get; private set; }
        public static UserSession Instance => _instance;

        private UserSession() { }

        public void SetCurrentUser(CinemaUser user)
            => CurrentUser = user;

        public void Clear()
            => CurrentUser = null;
    }
}
