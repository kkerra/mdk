   M S B A M L   `   `   `  ����L  HNavigationProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:NavigationProjectNavigationProject  5   	   "    NavigationProject.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   1localclr-namespace:NavigationProject     5   	   $	��450��5   E   $	��800��6R     � Title  6	   ��  �� ElementName$ 	MainFrame�� �� Path$ Content.Title�.��5
      ]� .+�5   
   �� $��MyApp��6   $	��Top=�6    
���P����5      �� 5       �� 
TargetType" ��6    �� Triggers 5      �� 5       �� Binding 6&   �� $ loginTextBox��$
 Text� �� Value	 admin6^   .a�5      ��  �� Property � �� �� Value
 �  ��6;   5      5      5      �� 5      -   5        	 ��Name$	 loginTextBox��5      $	��123��6,   $	��Top=�67   .��6L   .��5   $   5       � 5!   
   $	��100��6   $	��Top=�6!   .+�5"      �� -   5        
 ��Name$
 image1��5"      $	��100��6$   A� 5#      -   5         A�Name$ ellipse��5#      $	��100��6'   
���   �$��3��6B   �� 5$      -   5        $
 image2��5$      $	��100��6$   �� 5%      -   5        $
 image3��5%      $	��100��6$   �� 5&      -   5         ��Name$ rectange��5&      $	��100��6*   
���   �$��3��6F   $	��100��6Z   ��5'      �� 5(       �� EndPoint$ 0.5,1&�6*    �� 
StartPoint$ 0.5,0&�6;   .��5)      �  � Color$ Black��6'    � Offset$ 1Q�65   � 5*      $ White��6'   � 5+      $ 	#FF5D5D5D��6'   $ 0.212Q�69   � 5,      $ 	#FFF7790E��6'   $ 0.403Q�69   � 5-      $ 	#FFD6731E��6'   $	 0.5Q�69   � 5.      $ 	#FF94BD97��6'   $ 0.697Q�69   5/      51      52      �� 53   
   $
��2024��6   $��Bottom=�6   
�������67   �� 54   
   -   5         ��Name$ 
BackButton��54      $��
Назад��6%   65   �� 55   
   -   5        $ LightButton��55      $��Light��6&   $��50��6P   ��56      �� 57      " ��6    58      :� 59       :� RoutedEvent$ Click��6'   [�5:      �� 5;   "   .��5<   &   �� .��5=   *   W�  �� TargetProperty$ Height�6:    g� Duration$ 0:0:2D�5>   :   	 W� To 1005?   :    g� AutoReverse$
 True��5@   :   �� 5A   *   $ Color�69   $ 0:0:2D�5B   9    �� From
 Orange5C   9   	 �� To Aqua5D   9   $
 True��5E   9   5F   '   5G   #   5I      5K      5M      �� 5N   
   -	   5        $ 
DarkButton��5N      $
��Dark��6%   64    � 5O   
   -
   5          �Name$ 	MainFrame��5O        � NavigationUIVisibility$ Hidden=�6#   6C   5P      5Q      