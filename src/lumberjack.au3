; By: Ilham Kurniawan
; Git: https://github.com/ilhamline/autoscript.git
; Autoit script for sends a mouse click command to a Google Chrome window
; Lumberjack player bot (https://telegram.me/gamebot)

Local $i = 0
WinActivate("LumberJack - Google Chrome")
WinWaitActive("LumberJack - Google Chrome")
ControlClick("LumberJack - Google Chrome", "", "", "left", 1, "682", "614")
Sleep(20)
Local $leftCol
Local $rightCol
Local $left = True
Local $steps = 500

While $i < $steps
   If (Mod($i, 2) = 0) Then
	  Sleep(175)
	  If $left Then
		 $leftCol = Hex(PixelGetColor(621, 321), 6)
		 If ($leftCol == "D3F7FF") Then
			ControlClick("LumberJack - Google Chrome", "", "", "left", 1, "600", "625")
		 Else
			$left = False
			ControlClick("LumberJack - Google Chrome", "", "", "left", 1, "771", "625")
		 EndIf
		 Sleep(1)
	  Else
		 $rightCol = Hex(PixelGetColor(742, 321), 6)
		 If ($rightCol == "D3F7FF") Then
			ControlClick("LumberJack - Google Chrome", "", "", "left", 1, "771", "625")
		 Else
			$left = True
			ControlClick("LumberJack - Google Chrome", "", "", "left", 1, "600", "625")
		 EndIf
		 Sleep(1)
	  EndIf
   Else
	  If $left Then
		 ControlClick("LumberJack - Google Chrome", "", "", "left", 1, "600", "625")
	  Else
		 ControlClick("LumberJack - Google Chrome", "", "", "left", 1, "771", "625")
	  EndIf
	  Sleep(1)
   EndIf
   $i = $i + 1
WEnd