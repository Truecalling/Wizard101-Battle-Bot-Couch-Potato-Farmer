#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\..\..\Gma\Downloads\couch_potato_png_hd_couch_potato_png_500_fNF_icon.ico
#AutoIt3Wrapper_Res_Comment=A tool used for completing battles while being AFK.
#AutoIt3Wrapper_Res_Description=Wizard101 Battle Bot
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_ProductName=Made by St. Jimmy#9415
#AutoIt3Wrapper_Res_ProductVersion=1.00
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <ButtonConstants.au3>
#include <SmartBalanceSnackFarminglib.au3>
#include <SmartMythSnackFarminglib.au3>
#include <SmartFireSnackFarminglib.au3>
#include <SmartStormSnackFarminglib.au3>
#include <SmartIceSnackFarminglib.au3>
#include <PASSONLY.au3>

Global $School = "1"

Func GUICounter()

#Region ### START Koda GUI section ### Form=c:\users\user\documents\attackcounterform.kxf
$AttackCounterForm = GUICreate("Stat Tracker", 399, 232, 228, 125)
GUISetIcon("C:\Users\user\Downloads\Bogo-D-Manager-Manager-Suit-Red-Tie-Rose.ico", -1)
$Attacks = GUICtrlCreateLabel("Attacks Made", 8, 16, 191, 43)
GUICtrlSetFont(-1, 22, 400, 4, "MV Boli")
GUICtrlSetColor(-1, 0xFF0000)
Global $AttackCounter = GUICtrlCreateLabel("000", 64, 64, 82, 50, $SS_CENTER)
GUICtrlSetFont(-1, 26, 800, 0, "MV Boli")
GUICtrlSetColor(-1, 0xFF0000)
$AttacksLeft = GUICtrlCreateLabel("Attacks Left", 208, 16, 177, 43)
GUICtrlSetFont(-1, 22, 400, 4, "MV Boli")
GUICtrlSetColor(-1, 0x00FF00)
Global $LeftCounter = GUICtrlCreateLabel("000", 248, 64, 82, 50, $SS_CENTER)
GUICtrlSetFont(-1, 26, 800, 0, "MV Boli")
GUICtrlSetColor(-1, 0x00FF00)
$CardsEnchanted = GUICtrlCreateLabel("Cards Enchanted", 80, 120, 252, 45)
GUICtrlSetFont(-1, 24, 400, 4, "MV Boli")
GUICtrlSetColor(-1, 0xFFFF00)
Global $EnchantCounter = GUICtrlCreateLabel("000", 160, 168, 88, 56, $SS_CENTER)
GUICtrlSetFont(-1, 30, 400, 0, "MV Boli")
GUICtrlSetColor(-1, 0xFFFF00)
Global $StatusLabel = GUICtrlCreateLabel("Ready to run", 8, 184, 144, 25, $SS_CENTER)
GUICtrlSetFont(-1, 10, 400, 0, "MV Boli")
GUICtrlSetColor(-1, 0x000000)

$StartButton = GUICtrlCreateButton("Run", 288, 176, 91, 33)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")

$PotionLabel = GUICtrlCreateLabel("Potions", 168, 56, 71, 29)
GUICtrlSetFont(-1, 14, 400, 4, "MV Boli")
GUICtrlSetColor(-1, 0xFF00FF)
Global $PotionCounter = GUICtrlCreateLabel("3", 192, 88, 18, 32)
GUICtrlSetFont(-1, 16, 400, 0, "MV Boli")
GUICtrlSetColor(-1, 0xFF00FF)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			GUIDelete()
			Exit
		Case $StartButton
			MsgBox($MB_SYSTEMMODAL, "READ ME", "PRESS [ESC] TO CLOSE!", 3)
			If $School = 2 Then
				StormCheck()
				StormAttackReady()
			Else
			EndIf

				If $School = 3 Then
					FireCheck()
					FireAttackReady()
				EndIf
If $School = 4 Then
	MythCheck()
	MythAttackReady()
EndIf
If $School = 5 Then
	BalanceCheck()
	BalanceAttackReady()
EndIf
If $School = 6 Then
	IceCheck()
	IceAttackReady()
EndIf
	EndSwitch
WEnd
	EndFunc


#Region
Global $Main = GUICreate("Wizard101 Battle Bot", 286, 97, -1, -1)
GUISetIcon("C:\Users\user\Downloads\Bogo-D-Manager-Manager-Suit-Red-Tie-Rose.ico", -1)
Global $BalanceButton = GUICtrlCreateButton("Balance", 8, 8, 75, 25)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
Global $StormButton = GUICtrlCreateButton("Storm", 104, 8, 75, 25)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
Global $MythButton = GUICtrlCreateButton("Myth", 200, 8, 75, 25)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
Global $FireButton = GUICtrlCreateButton("Fire", 8, 56, 75, 25)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
Global $IceButton = GUICtrlCreateButton("Ice", 104, 56, 75, 25)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
Global $PassButton = GUICtrlCreateButton("Pass Only", 200, 56, 75, 25)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
Exit
		Case $BalanceButton
			$School = $School + 4
			GUISetState(@SW_HIDE)
			GUISetState(@SW_DISABLE, $Main)
            GUICounter()
            GUISetState(@SW_ENABLE, $Main)
            GUISetState(@SW_RESTORE,$Main)
		Case $StormButton
			$School = $School + 1
			GUISetState(@SW_HIDE)
			 GUISetState(@SW_DISABLE, $Main)
            GUICounter()
            GUISetState(@SW_ENABLE, $Main)
            GUISetState(@SW_RESTORE,$Main)

		Case $MythButton
			$School = $School + 3
			GUISetState(@SW_HIDE)
			GUISetState(@SW_HIDE)
			GUISetState(@SW_DISABLE, $Main)
            GUICounter()
            GUISetState(@SW_ENABLE, $Main)
            GUISetState(@SW_RESTORE,$Main)
		Case $FireButton
			$School = $School + 2
			GUISetState(@SW_HIDE)
			GUISetState(@SW_DISABLE, $Main)
            GUICounter()
            GUISetState(@SW_ENABLE, $Main)
            GUISetState(@SW_RESTORE,$Main)
		Case $IceButton
			$School = $School + 5
			GUISetState(@SW_HIDE)
			GUISetState(@SW_HIDE)
			GUISetState(@SW_DISABLE, $Main)
            GUICounter()
            GUISetState(@SW_ENABLE, $Main)
            GUISetState(@SW_RESTORE,$Main)
		Case $PassButton
			MsgBox($MB_SYSTEMMODAL, "READ ME", "PRESS [ESC] TO CLOSE!", 3)
			GUISetState(@SW_HIDE)
		Pass1()
	EndSwitch

WEnd
