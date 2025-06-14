﻿using Avalonia.Controls;
using Avalonia.Controls.Templates;
using PractWork1.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PractWork1
{
    public class ViewLocator : IDataTemplate
    {
        public bool SupportsRecycling => false;

        public Control? Build(object data)
        {
            var name = data.GetType().FullName.Replace("ViewModel", "View");
            var type = Type.GetType(name);
            if(type != null)
            {
                return (Control)Activator.CreateInstance(type);
            }
            else
            {
                return new TextBlock { Text = $"Not found: {name}" };
            }
        }

        public bool Match(object? data)
        {
            return data is ViewModelBase;
        }
    }
}
