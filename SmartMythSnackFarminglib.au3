#include <Passlib.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#RequireAdmin
HotKeySet("{ESC}","Exit4")
WinActivate("Wizard101")
Local $ClientPos = WinGetPos("Wizard101")
Local $mana = 1
Local $manatotal = 1
Local $EnchantsUsed = 1
Local $AttacksMade = 1
Local $PotionCounter = 3
Local $Potions = 3
$StatusLabel = "Waiting"
$EnchantCounter = 1
$AttackCounter = 1
$LeftCounter = $mana
Func MythCheck()
Local $mana = InputBox("Mana","How much mana you got RN?")
Local $manatotal = InputBox("Mana" , "Whats your max total?")
$AttacksMade = $AttacksMade -1
$EnchantsUsed = $EnchantsUsed -1
$mana = Floor($mana/4 -1)
EndFunc
;made by St. Jimmy
;MythCheck() and MythAttackReady()
Func MoreMyth()
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



Func ShouldPassMyth()
   PixelSearch($ClientPos[0] + 248, $ClientPos[1] + 293, $ClientPos[0] + 591, $ClientPos[1] + 301, 0x494949,10)
   If Not @error Then
	  ConsoleWrite("Detected you needing to pass")
	  GuiCtrlSetData($StatusLabel,"Passing")
	  Pass()
	  Sleep(4500)
   Else
	  ConsoleWrite("Did not detect you needed to pass.")
	  EndIf
   EndFunc

Func EncSearchMyth()
Local $eTornado = PixelSearch($ClientPos[0] + 244, $ClientPos[1] + 301, $ClientPos[0] + 614, $ClientPos[1] + 331, 0x00CE91,10)
 If Not @error Then
	 GuiCtrlSetData($StatusLabel,"Enchanting")
	 $EnchantsUsed = $EnchantsUsed +1
	MouseClick("left",$eTornado[0],$eTornado[1])
	GuiCtrlSetData($EnchantCounter,$EnchantsUsed)
	Sleep(250)
	MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,25)
	Sleep(100)
	Local $ClickEnc = PixelSearch($eTornado[0] - 15, $eTornado[1] + 15, $eTornado[0] + 15, $eTornado[1] - 15, 0x00CE91,10)
	If Not @error Then
	   MouseClick("left",$ClickEnc[0],$ClickEnc[1])
	Sleep(250)
	MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,25)
	Sleep(150)
	  ManaCheckMyth()
	  ConsoleWrite("Added 1 attack counter")
Else
   ConsoleWrite("Couldn't find enchanted Sandstorm.")
   GuiCtrlSetData($StatusLabel,"ERROR#69")
   Sleep(3000)
EndIf
EndIf
EndFunc


Func EpicCheckMyth()
	GuiCtrlSetData($StatusLabel,"Analyzing")
	Sleep(1900)
Local $Epic = PixelSearch($ClientPos[0] + 272, $ClientPos[1] + 290, $ClientPos[0] + 591, $ClientPos[1] + 301, 0xB77F00,10)
If Not @error Then
	GuiCtrlSetData($StatusLabel,"Found Enchant")
   MouseClick("left", $Epic[0] , $Epic[1])
   ConsoleWrite("Epic Found")
   Sleep(150)
   MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,25)
   Sleep(150)
   EncSearchMyth()
Else
	GuiCtrlSetData($StatusLabel,"No enchant detected.")
   Sleep(1900)
   ConsoleWrite("Couldn't find epic")
EndIf
EndFunc


Func ManaCheckMyth()
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
	  ConsoleWrite($mana)
	  Else
	  Sleep(1000)
	  MouseClick("left", $ClientPos[0] + 277,$ClientPos[1] + 296)
	  sleep(50)
	  MouseClick("left",$ClientPos[0]+339,$ClientPos[1]+297)
	  Sleep(150)
	  ConsoleWrite("Looking for Potion")
	  GuiCtrlSetData($StatusLabel,"Looking for Potion")
	  ManaCheckMyth()
EndIf
   Else
	  $mana = $mana - 1
	  $LeftCounter = $mana
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

Func MythAttackReady()
	GuiCtrlSetData($StatusLabel,"Analyzing")
	GuiCtrlSetData($AttackCounter,$AttacksMade)
	GuiCtrlSetData($LeftCounter,$mana)
	GuiCtrlSetData($EnchantCounter,$EnchantsUsed)
   MoreMyth()
   ShouldPassMyth()
   EpicCheckMyth()
   ;pixelsearch for sandstorm in hand(use autoit finder tool and select top of card)
   PixelSearch($ClientPos[0] + 244, $ClientPos[1] + 301, $ClientPos[0] + 614, $ClientPos[1] + 331, 0x00CE91,10)
   If Not (@error) Then
	  MouseClick("left", $ClientPos[0] + 277,$ClientPos[1] + 296)
	  Sleep(1000)
	  MouseClick("left", $ClientPos[0] + 277,$ClientPos[1] + 296)
	  Sleep(5000)
	  ConsoleWrite("1")
	  ManaCheckMyth()
	  Sleep(5000)
	  ;for next ps
	  MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,80)
   Else
	  PixelSearch($ClientPos[0] + 272, $ClientPos[1] + 290, $ClientPos[0] + 591, $ClientPos[1] + 301, 0x333433,10)
	  ;this part is incase if a mob joins late, it will pass for you(PS)
	  If Not (@error) Then
		 ConsoleWrite("2")
		Pass()
		GuiCtrlSetData($StatusLabel,"Passing")
		Sleep(10000)
	 Else
		PixelSearch($ClientPos[0] + 339, $ClientPos[1] + 297, $ClientPos[0] + 339, $ClientPos[1] + 297, 0x00984A,10)
		If Not @error Then
		   ConsoleWrite("3")
		   MouseClick("left",$ClientPos[0]+339,$ClientPos[1]+297)
		   Sleep(150)
		   MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,80)
		   Sleep(50)
		   ManaCheckMyth()
			Sleep(50)
		Else
			GuiCtrlSetData($StatusLabel,"In/Out Battle")
			MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,80)
			WinActivate("Wizard101")
			Opt("SendKeyDownDelay",600)
			Sleep(150)
			Send("w")
			Sleep(150)
			Send("s")
   EndIf
EndIf
EndIf
   EndFunc


Func Exit4()
Exit
EndFunc