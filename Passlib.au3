HotKeySet("{ESC}","Exit10")
WinActivate("Wizard101")
Local $ClientPos = WinGetPos("Wizard101")

Func Passcheck()
   While PixelGetColor($ClientPos[0]+316,$ClientPos[1]+334) = 0x55A534
	  Sleep(200)
   WEnd
   EndFunc


Func Pass()
   PixelSearch($ClientPos[0] + 253, $ClientPos[1] + 400, $ClientPos[0] + 253, $ClientPos[1] + 400,0xFFFF00,15)
   If Not @error Then
	  MouseClick("left", $ClientPos[0] + 253, $ClientPos[1] + 400)
	  ConsoleWrite("Passing")
	  sleep(250)
	  MouseMove($ClientPos[0]+606,$ClientPos[1]+119,50)
	  Sleep(50)
	  PixelSearch($ClientPos[0] + 316, $ClientPos[1] + 334, $ClientPos[0] + 316, $ClientPos[1] + 334,0x55A534,15)
	  If Not @error Then
		 ConsoleWrite("Pass Successful, waiting...")
		 Sleep(50)
		 Passcheck()
	  Else
		 ConsoleWrite("Either in battle or error")
		 Sleep(50)
	  EndIf
   Else
	  ConsoleWrite("unknown error")
   EndIf


   EndFunc





Func Exit10()
Exit
EndFunc