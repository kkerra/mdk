   M S B A M L   `   `   `  ����@  <Task1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:Task1Task1  5   	       Task1.AuthorizationForm   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   %localclr-namespace:Task1     5   	     � Title$  AuthorizationForm��5   	   $	��450��6#   $	��800��60   .��5	      �  � RowDefinitions 5
   
   �� 5      �� 5      �� 5      �� 5       � ColumnDefinitions 5   
   �� 5      �� 5      .+�5   
   �� $��
Логин��6   �� 5   
   -   5         ��Name$ loginTextBox��5      $��1��6(   �� 5   
   $��Пароль��6   $��1��6!   �� 5   
   -   5        $ passwordTextBox��5      $��1��6+   $��1��6;   �� 5   
   $��E-mail��6   $��2��6!   �� 5   
   -   5        $ emailTextBox��5   /   $��2��6   $��1��6   6/   �� 5   
   -   5         ��Name$ 
saveButton��5   B   $��Сохранить��6   $��1��6%   $��3��65   6V   �� 5   
   $��3��6   .+�5      �� -   5        $ darkThemeButton��5   1   $
��Dark��6   $��3��6$   6J   �� 5      -   5        $ lightThemeButton��5   2   $��Light��6   $��3��6%   6L   5      5       5!      