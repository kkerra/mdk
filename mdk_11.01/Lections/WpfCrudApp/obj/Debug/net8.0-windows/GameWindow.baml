   M S B A M L   `   `   `  ����E  AWpfCrudApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:WpfCrudApp
WpfCrudApp  5   	       WpfCrudApp.GameWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:WpfCrudApp     5   	     � Title$  
GameWindow��5   	   $	��350��6   $	��400��6)   .��5	      �� .+�5
   
   �� $��Название��6   �� 5   
   -   5         ��Name$ NameTextBox��5      ��6'   �� *Name+�� 5   
   $��Цена��6   �� 5   
   -   5        $ PriceTextBox��5      ��6(   �� *Price+�� 5   
   $��Категория��6   �� 5   
   -   5         ��Name$ CategoriesComboBox��5       �� DisplayMemberPath$
 Name��5       �� SelectedValuePath$ 
CategoryId��5       �� SelectedValue 5      �� *
CategoryId+�� 5   
   $��Описание��6   �� 5   
   -   5        $ DescriptionTextBox��5       �� AcceptsReturn$
 True��6.    �� MaxLines$ 5��6C   $	��100��6P   ��6]   �� *Description+�� 5   
   -   5         ��Name$ 
SaveButton��5      $��Сохранить��6%   69   5      5      