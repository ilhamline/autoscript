; By: Ilham Kurniawan
; Git: https://github.com/ilhamline/autoscript.git
; Autoit script for sends a mouse click command to a Google Chrome window
; More advanced lumberjack player bot (https://telegram.me/gamebot)

Local $i = 0
WinActivate("LumberJack - Google Chrome")
WinWaitActive("LumberJack - Google Chrome")
ControlClick("LumberJack - Google Chrome", "", "", "left", 1, "682", "614")
Sleep(250)
Local $leftOne, $leftTwo, $leftThree
Local $rightOne, $rightTwo, $rightThree
Local $left = True
Local $steps = 750

While $i < $steps
   If $left Then
	  checkLeft()
   Else
	  checkRight()
   EndIf
WEnd

Func checkLeft()
   $leftOne = Hex(PixelGetColor(621, 321), 6)
   $leftTwo = Hex(PixelGetColor(621, 221), 6)
   $leftThree = Hex(PixelGetColor(621, 128), 6)

   If ($leftOne == "D3F7FF") And ($leftTwo == "D3F7FF") And ($leftThree == "C7F0F9") Then
	  doLeft(6)
	  $i = $i + 6
	  Sleep(174)
   ElseIf ($leftOne == "D3F7FF") And ($leftTwo == "D3F7FF") Then
	  doLeft(4)
	  doRight(2)
	  $i = $i + 6
	  $left = False
	  Sleep(174)
   ElseIf ($leftOne == "D3F7FF") Then
	  $rightThree = Hex(PixelGetColor(742, 125), 6)
	  doLeft(2)
	  If ($rightThree == "D3F7FF") Then
		 doRight(4)
		 $left = False
	  Else
		 doRight(2)
		 doLeft(2)
	  EndIf
	  $i = $i + 6
	  Sleep(174)
   Else
	  $left = False
	  checkRight()
   EndIf
EndFunc

Func checkRight()
   $rightOne = Hex(PixelGetColor(742, 325), 6)
   $rightTwo = Hex(PixelGetColor(742, 225), 6)
   $rightThree = Hex(PixelGetColor(742, 125), 6)

   If ($rightOne == "D3F7FF") And ($rightTwo == "D3F7FF") And ($rightThree == "D3F7FF") Then
	  doRight(6)
	  $i = $i + 6
	  Sleep(174)
   ElseIf ($rightOne == "D3F7FF") And ($rightTwo == "D3F7FF") Then
	  doRight(4)
	  doLeft(2)
	  $i = $i + 6
	  $left = True
	  Sleep(174)
   ElseIf ($rightOne == "D3F7FF") Then
	  $leftThree = Hex(PixelGetColor(621, 128), 6)
	  doRight(2)
	  If ($leftThree == "C7F0F9") Then
		 doLeft(4)
		 $left = True
	  Else
		 doLeft(2)
		 doRight(2)
	  EndIf
	  $i = $i + 6
	  Sleep(174)
   Else
	  $left = True
	  checkLeft()
   EndIf
EndFunc

Func doLeft($a)
   While $a > 0
	  ControlClick("LumberJack - Google Chrome", "", "", "left", 1, "600", "625")
	  $a = $a - 1
	  Sleep(1)
   WEnd
EndFunc

Func doRight($a)
   While $a > 0
	  ControlClick("LumberJack - Google Chrome", "", "", "left", 1, "771", "625")
	  $a = $a - 1
	  Sleep(1)
   WEnd
EndFunc
