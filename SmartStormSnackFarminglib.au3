#RequireAdmin
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
HotKeySet("{ESC}","Exit5")
WinActivate("Wizard101")
Local $ClientPos = WinGetPos("Wizard101")
Local $mana = 1
Local $manatotal = 1
Local $EnchantsUsed = 1
Local $AttacksMade = 1
Local $PotionCounter = 3
Local $Potions = 3
Func StormCheck()
Global $mana = InputBox("Mana","How much mana you got RN?")
Global $manatotal = InputBox("Mana" , "Whats your max total?")
$AttacksMade = $AttacksMade -1
$EnchantsUsed = $EnchantsUsed -1
$mana = Floor($mana/4)
EndFunc

$StatusLabel = "Waiting"
$EnchantCounter = 1
$AttackCounter = 1
$LeftCounter = $mana
Local $StormRun = False
;Made by St. Jimmy
;StormCheck() and StormAttackReady()
Func MoreStorm()
   Local $More = PixelSearch($ClientPos[0] + 661, $ClientPos[1] + 612, $ClientPos[0] + 661, $ClientPos[1] + 612, 0x822441,10)
   If Not @error Then
	  MouseClick("left",$More[0],$More[1])
	  Sleep(50)
	  MouseClick("left",$More[0],$More[1])
	  Sleep(50)
	  MouseClick("left",$More[0],$More[1])
	  MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,80)
	  EndIf
EndFunc

Func EncSearchStorm()
	ConsoleWrite($mana)
Local $eTornado = PixelSearch($ClientPos[0] + 272, $ClientPos[1] + 290, $ClientPos[0] + 591, $ClientPos[1] + 301, 0x521463,10)
 If Not @error Then
	 GuiCtrlSetData($StatusLabel,"Enchanting")
	 $EnchantsUsed = $EnchantsUsed +1
   Sleep(150)
	MouseClick("left",$eTornado[0],$eTornado[1])
	GuiCtrlSetData($EnchantCounter,$EnchantsUsed)
	Sleep(250)
	MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,25)
	Sleep(100)
	Local $ClickEnc = PixelSearch($eTornado[0] - 25, $eTornado[1] + 25, $eTornado[0] + 25, $eTornado[1] - 25, 0xC49500,10)
	If Not @error Then
	   MouseClick("left",$ClickEnc[0],$ClickEnc[1])
	Sleep(250)
	MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,25)
	Sleep(1500)
	  ManaCheckStorm()
Else
   ConsoleWrite("Couldn't find enchanted Sandstorm.")
   GuiCtrlSetData($StatusLabel,"ERROR#69")
   Sleep(3000)
EndIf
EndIf
EndFunc


Func EpicCheckStorm()
	GuiCtrlSetData($StatusLabel,"Analyzing")
	Sleep(1900)
Local $Epic = PixelSearch($ClientPos[0] + 272, $ClientPos[1] + 290, $ClientPos[0] + 591, $ClientPos[1] + 301, 0xB77F00,10)
If Not @error Then
	GuiCtrlSetData($StatusLabel,"Found Enchant")
   MouseClick("left", $Epic[0] , $Epic[1])
   ConsoleWrite("Epic Found")
   Sleep(250)
   MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,25)
   Sleep(350)
   EncSearchStorm()
Else
   ConsoleWrite("Couldn't find epic")
   GuiCtrlSetData($StatusLabel,"No enchant detected.")
   Sleep(1900)
EndIf
EndFunc


Func ManaCheckStorm()
	GuiCtrlSetData($StatusLabel,"Attacking")
	Sleep(3500)
If $mana < 1 Then
   PixelSearch($ClientPos[0] + 135, $ClientPos[1] + 579, $ClientPos[0] + 135, $ClientPos[1] + 579, 0xF8D2FF,10)
   If Not @error Then
	  sleep(50)
	  MouseClick("left",$ClientPos[0] + 128, $ClientPos[1] + 571)
	  sleep(50)
	  $Potions = $Potions - 1
	 GuiCtrlSetData($PotionCounter,$Potions)
	  ConsoleWrite("Used mana Elixer")
	  Sleep(50)
	  $mana = Floor($manatotal/4)
	  GuiCtrlSetData($StatusLabel,"Used mana potion")
	  ConsoleWrite($mana)
	  Sleep(3000)
	  Else
	  Sleep(1000)
	  MouseClick("left", $ClientPos[0] + 277,$ClientPos[1] + 296)
	  sleep(50)
	  MouseClick("left",$ClientPos[0]+339,$ClientPos[1]+297)
	  Sleep(150)
	  ConsoleWrite("Looking for Potion")
	  GuiCtrlSetData($StatusLabel,"Looking for Potion")
	  MoreStorm()
	  ManaCheckStorm()
EndIf
   Else
	  $mana = $mana - 1
	  $LeftCounter = $mana
	  $AttackCounter = $AttackCounter +1
	  ConsoleWrite("Added 1 attack counter")
	  GuiCtrlSetData($StatusLabel,"+1 Attack Counter")
	 $AttacksMade = $AttacksMade +1
	 GuiCtrlSetData($AttackCounter,$AttacksMade)
	  Sleep(50)
	  GuiCtrlSetData($LeftCounter,$mana)
	  Sleep(2000)
	  GuiCtrlSetData($StatusLabel,"Waiting")
	  EndIf
EndFunc

Func StormAttackReady()
	GuiCtrlSetData($StatusLabel,"Analyzing")
	GuiCtrlSetData($AttackCounter,$AttacksMade)
	GuiCtrlSetData($LeftCounter,$mana)
	GuiCtrlSetData($EnchantCounter,$EnchantsUsed)
	ConsoleWrite($mana)
	$StormRun = True
	While $StormRun = True
   MoreStorm() ;enable for snackpack farming thing
   EpicCheckStorm()
   ;pixelsearch for sandstorm in hand(use autoit finder tool and select top of card)
   PixelSearch($ClientPos[0] + 272, $ClientPos[1] + 290, $ClientPos[0] + 591, $ClientPos[1] + 301, 0x521463,10)
   If Not (@error) Then
	  MouseClick("left", $ClientPos[0] + 277,$ClientPos[1] + 296)
	  Sleep(1000)
	  MouseClick("left", $ClientPos[0] + 277,$ClientPos[1] + 296)
	  Sleep(5000)
	  ConsoleWrite("1")
	  ManaCheckStorm()
	  Sleep(5000)
	  ;for next ps
	  MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,80)
   Else
	  GuiCtrlSetData($StatusLabel,"In or out of battle")
			MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,80)
			WinActivate("Wizard101")
			Opt("SendKeyDownDelay",650)
			Sleep(150)
			Send("w")
			Sleep(150)
			Send("s")
		 EndIf
		 WEnd
EndFunc

Func Exit5()
$StormRun = False

EndFunc