using System.Data;

namespace Task3
{
    internal class InfoEventArgs : EventArgs
    {
        public string PropertyName { get; set; }
        public string ErrorText { get; set; }
        public DateTime ChangeDate { get; set; }
    }
}
