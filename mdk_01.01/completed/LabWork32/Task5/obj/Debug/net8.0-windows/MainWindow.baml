   M S B A M L   `   `   `  ����@  <Task5, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:Task5Task5  5   	       Task5.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   %localclr-namespace:Task5     5   	     � Title$  
MainWindow��5   	   $	��450��6   $	��800��6)    � 	Resources 5
         UserTemplate��%!   &	        �� 5   
   5      5      .��5      �  � RowDefinitions 5   
   �� 5      �� 5      �� 5       � ColumnDefinitions 5   
   �� 5      �� 5      .+�5   
   �� -   5         ��Name$ usersListBox��5       �� DisplayMemberPath$ Login��6(    �� SelectionMode$ Multiple=�6B   �� 5   
   -   5         ��Name$ usersListView��5      $ Login��6*   $ Multiple=�6D   $��1��6]   �� 5   
   -   5         ��Name$ usersComboBox��5      $ Login��6*   $��2��6D   �� 5   
   -   5        	 ��Name$	 usersListBoxLabel��5      $��1��6+   �� 5   
   -   5        $	 usersListViewLabel��5      $��1��6,   $��1��6<   �� 5   
   -   5        $	 usersComboBoxLabel��5      $��1��6,   $��2��6<   5      5       