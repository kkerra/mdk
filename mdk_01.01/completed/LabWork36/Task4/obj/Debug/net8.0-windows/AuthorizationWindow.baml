   M S B A M L   `   `   `  ����@  <Task4, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:Task4Task4  5   	       Task4.AuthorizationWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   %localclr-namespace:Task4     5   	     � Title$  Авторизация��5   	   $	��450��6   $	��800��6*   $	��200��66   $	��500��6F    � WindowStartupLocation$ CenterScreen=�6U   .��5	      �  � RowDefinitions 5
   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6    � ColumnDefinitions 5   
   �� 5      �� 5      .+�5   
   �� $��
Логин��6   �� 5   
   $��Пароль��6   $��1��6!   �� 5   
   -   5         ��Name$ loginTextBox��5      $��1��6(   �� 5   
   -   5        $ passwordTextBox��5      $��1��6+   $��1��68   �� 5   
   -   5         ��Name$ loginButton��5      $��
Войти��6&   $��1��66   $��2��6F   6S   �� 5   
   -   5        $ cancelButton��5      $��Отмена��6'   $��2��68   5      5      