namespace ConsoleApp1
{
    internal class Person
    {
        #region Данные класса(поля и константы)
        private string name;
        public byte age;
        public const byte MajorityAge = 18;
        #endregion

        #region Методы класса
        public void Print() => Console.WriteLine($"Имя: {Name}, лет: {age}");

        #endregion

        #region Конструктор
        public Person() : this("unknown", 18)
        {
        }

        public Person(string name, byte age)
        {
            Name = name;
            this.age = age;
        }
        #endregion

        #region Свойства
        public string Name
        {
            get
            {
                return name;
            }

            set
            {
                value = value.Trim();
                if (value != "")
                    name = value;
            }
        }

        public double Money { get; set; } //автосвойство
        #endregion

        #region Индексаторы
        public object? this[int fieldNumber]
        {
            get
            {
                if (fieldNumber == 1)
                    return name;
                if (fieldNumber == 2)
                    return age;
                return null;
            }
        }
        #endregion
    }
}
