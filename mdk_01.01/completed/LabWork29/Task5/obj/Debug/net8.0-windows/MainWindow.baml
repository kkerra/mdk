   M S B A M L   `   `   `  ����@  <Task5, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:_5_5  5   	       _5.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   "localclr-namespace:_5     5   	     � Title$  
MainWindow��5   	   $	��450��6   $	��800��6)    � 	Resources 5
       �� 
TargetType   RegisterButtonStyle �� Property �� Value �� Triggers ^� 
Conditions �� Binding �� ElementName	 �� Path
 �� Value��%Y  &	        �� 5   
   " ��6   .�5      ��  � {�$ False��6*    5      ^� 5       5      �� 5       6$   �� $ TermsCheckBox��$	 	IsChecked�
 True6b   �� 5       6$   �� $ AgreementCheckBox��$	 	IsChecked�
 True6f   0�5      �� 5       � {�$
 True��66   5      5      5      .��5      � .+�5   
   �� -   5         ��Name$ TermsCheckBox��5      $G��AСогласен с условиями использования��6*   $��Center=�6W   $	��Top=�6t   �� 5   
   -   5        $ AgreementCheckBox��5      $'��!Прочел соглашение��6.   $��Center=�6J   $��Center=�6g   �� 5   
   $*��$Зарегистрироваться��6   #��[  6.   $��Center=�6[   $��Bottom=�6x   $��5q�6�   5      5       