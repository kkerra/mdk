   M S B A M L   `   `   `  ����F  BLection1605, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:Lection1605Lection1605  5   	       Lection1605.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:Lection1605     5   	     � Title$  
MainWindow��5   	   $	��450��6   $	��800��6)   .��5	      �� .+�5
   
   �� -   5        $��soundplayer��5
      $
��Play��6$    � Triggers 5      :� 5       :� RoutedEvent$ Button.Click��6   [�5      �� 5      .��5      �� .��5   "   p�  p� Source$ video\The Matrix.mp4?�60    �� 
TargetName$ myMediaElement��5   0   5      5      5      5      �� 5   
   -   5         ��Name$ testSoundPlayer��5      $��test soundPlayer��5      5      �� 5   
   -   5        $ testSystemSoundPlayer��5      $��test system sound��5      5      �� 5!   
   -   5        $ testMediaPlayer��5!      $��test mediaPlayer��5"      5#      r� 5%   
    r� Source$ 
forest.wav?�6   �� 5&   
   -   5        $ pauseMediaPlayer��5&      $��Pause��5'      5(      r� 5)   
   -   5         r�Name$ myMediaElement��5)       r� LoadedBehavior$ Manual=�6/   	 r� UnloadedBehavior$
	 Stop=�6G   
 J� Clip
 5*      @� 5+       @� Center$ 100,200&�6"    @� RadiusX$	 200Q�63    @� RadiusY$	 100Q�6A   5-      5.      5/      