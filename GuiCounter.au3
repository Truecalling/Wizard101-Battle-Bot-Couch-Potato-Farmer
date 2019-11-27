Func OpenGuiCounter()
#Region ### START Koda GUI section ### Form=c:\users\user\documents\attackcounterform.kxf
$AttackCounterForm = GUICreate("Stat Tracker", 399, 267, 192, 124)
$AttacksLabel = GUICtrlCreateLabel("Attacks Made", 16, 16, 198, 41)
GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
$AttackCounter = GUICtrlCreateLabel("000", 72, 72, 73, 50)
GUICtrlSetFont(-1, 30, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
$AttacksLeft = GUICtrlCreateLabel("Attacks left", 224, 16, 161, 41)
GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
$LeftCounter = GUICtrlCreateLabel("000", 272, 64, 73, 50)
GUICtrlSetFont(-1, 30, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
$CardsEnchanted = GUICtrlCreateLabel("Cards Enchanted", 80, 136, 252, 41)
GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFFFF00)
$EnchantCounter = GUICtrlCreateLabel("000", 168, 192, 70, 50)
GUICtrlSetFont(-1, 30, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFFFF00)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd

	EndFunc()