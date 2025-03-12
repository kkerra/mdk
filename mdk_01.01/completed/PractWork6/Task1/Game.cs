using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace Task1
{
    public class Game : IDataErrorInfo, IValueConverter
    {
        public int IdGame { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Category { get; set; }
        public double Price { get; set; }
        public int Discount { get; set; }

        public string Error => null;

        public string this[string columnName]
        {
            get
            {
                string error = String.Empty;
                switch(columnName)
                {
                    case "Name":
                        if (Name.Length < 2)
                            error = "В имени больше двух символов";
                        break;
                    case "Price":
                        if (Price < 0)
                            error = "Цена не может быть отрциательной";
                        break;
                    case "Discount":
                        if ((Discount < 1) && (Discount > 30))
                            error = "Скидка в пределах 1-30%";
                        break;
                }
                return error;
            }
        }

        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
