   M S B A M L   `   `   `  ����@  <Task1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:Task1Task1  5   	       Task1.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   %localclr-namespace:Task1     5   	     � Title$  
MainWindow��5   	   $	��450��6   $	��800��6)   .��5	      �� .+�5
   
   �� -   5         ��Name$ gamesListView��5
      ��6*   �� *Games+ �� View 5      �� 5      .P�5      �� $��
Номер��6%    �� DisplayMemberBinding 64   �� *IdGame+�� 5      $��Название��6%    67   �� *Name+�� 5      $��Описание��6%    67   �� *Description+�� 5      $��Категория��6%    68   �� *
Category+�� 5      $��Цена��6%    63   �� *Price+�� 5      $��Скидка��6%    65   �� *
Discount+5      5      �� 5   
   -   5         ��Name$ gameIdTextBox��5      ��6)   ��  �� ElementName$ gamesListView�� �� Path$ SelectedItem.IdGame��� 5   
   -   5        $ nameTextBox��5      .��6'   ��5      �� 5      $ gamesListView��6   $ SelectedItem.Name�66    �� NotifyOnValidationError$
 True��6O    �� ValidationRules 5      5  /System.Windows.Controls.DataErrorValidationRule  5      5      .��5      5      �� 5    
   -   5        $ descriptionTextBox��5       ��6.   �� $ gamesListView��$ SelectedItem.Description��� 5!   
   -   5        $ priceTextBox��5!      .��6(   ��5"      �� 5#      $ gamesListView��6   $ SelectedItem.Price�66   $
 True��6P    5$        5%      5'      .��5(      5)      �� 5*   
   -   5        $ discountTextBox��5*      .��6+   ��5+      �� 5,      $ gamesListView��6   $ SelectedItem.Discount�66   $
 True��6S    5-        5.      50      .��51      52      �� 53   
   -   5        $ categoryTextBox��53      ��6+   �� $ gamesListView��$ SelectedItem.Category��� 54   
   -   5        	 ��Name$	 categoryComboBox��54      6-   55      56      