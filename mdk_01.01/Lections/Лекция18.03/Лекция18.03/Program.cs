using Лекция18._03;

Person person = new Person();
person.PropertyChanged += Person_PropertyChanged;

person.Name = "name1";
person.Name = "name2";
person.Age = 18;

void Person_PropertyChanged(object? sender, System.ComponentModel.PropertyChangedEventArgs e)
{
    Console.WriteLine(e.PropertyName);
}