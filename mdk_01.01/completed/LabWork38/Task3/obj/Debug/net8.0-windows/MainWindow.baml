   M S B A M L   `   `   `  ����@  <Task3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:Task3Task3  5   	       Task3.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   %localclr-namespace:Task3     5   	     � Title$  
MainWindow��5   	   $	��450��6   $	��800��6)   .��5	      �� .+�5
   
   �� -   5         ��Name$ directoryTextBox��5
      $��20��6,   $��C:\temp\ispp35\ОПБД��68   &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ filesDataGrid��5         AutoGenerateColumns$ False��6*      Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Имя файла��6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 68   �� *Name+  5      $ Расширение��6%    69   �� *	Extension+  5      $ Путь��6%    63   �� *DirectoryName+  5      $ Размер��6%    65   �� *Length+  5      $ Дата создания��6%    6<   �� *CreationTime+5      �� 5   
   -   5         ��Name$ showMoreButton��5      $#��Показать больше��6)   �� 5   
   -   5         ��Name$ 
countLabel��5      �� 5   
   -   5        $ pageSizeTextBox��5      $��5��6+   64   �� 5   
   -   5        $ pageTextBox��5      6'   �� 5   
   $��50��6   $��<<��6   $
��Left=�6/   �� 5   
   $��50��6   $��<��6   5      5      