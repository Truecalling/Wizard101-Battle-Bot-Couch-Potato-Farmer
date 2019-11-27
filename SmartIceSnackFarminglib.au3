#RequireAdmin
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
HotKeySet("{ESC}","Exit8")
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
Func IceCheck()
Global $mana = InputBox("Mana","How much mana you got RN?")
Global $manatotal = InputBox("Mana" , "Whats your max total?")
$AttacksMade = $AttacksMade -1
$EnchantsUsed = $EnchantsUsed -1
$mana = Floor($mana/4 -1)
EndFunc
;made by St. Jimmy
;IceCheck() and IceAttackReady()
Func MoreIce()
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

Func ShouldPassIce()
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

Func EncSearchIce()
Local $eTornado = PixelSearch($ClientPos[0] + 272, $ClientPos[1] + 290, $ClientPos[0] + 591, $ClientPos[1] + 301, 0x058AE1,10)
 If Not @error Then
	 GuiCtrlSetData($StatusLabel,"Enchanting")
	 $EnchantsUsed = $EnchantsUsed +1
	MouseClick("left",$eTornado[0],$eTornado[1])
	GuiCtrlSetData($EnchantCounter,$EnchantsUsed)
	Sleep(250)
	MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,25)
	Sleep(100)
	Local $ClickEnc = PixelSearch($eTornado[0] - 15, $eTornado[1] + 15, $eTornado[0] + 15, $eTornado[1] - 15, 0xC49500,10)
	If Not @error Then
	   MouseClick("left",$ClickEnc[0],$ClickEnc[1])
	Sleep(250)
	MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,25)
	Sleep(150)
	  ManaCheckIce()
	  ConsoleWrite("Added 1 attack counter")
Else
   ConsoleWrite("Couldn't find enchanted Sandstorm.")
   GuiCtrlSetData($StatusLabel,"ERROR#69")
   Sleep(3000)
EndIf
EndIf
EndFunc


Func EpicCheckIce()
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
   EncSearchIce()
Else
   ConsoleWrite("Couldn't find epic")
   GuiCtrlSetData($StatusLabel,"No enchant detected.")
   Sleep(1900)
EndIf
EndFunc


Func ManaCheckIce()
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
	  ManaCheckIce()
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

Func IceAttackReady()
	While 1
   MoreIce()
   GuiCtrlSetData($StatusLabel,"Analyzing")
	GuiCtrlSetData($AttackCounter,$AttacksMade)
	GuiCtrlSetData($LeftCounter,$mana)
	GuiCtrlSetData($EnchantCounter,$EnchantsUsed)
   ShouldPassIce()
   EpicCheckIce()
   ;pixelsearch for sandstorm in hand(use autoit finder tool and select top of card)
  Local $NoEncBlizzard = PixelSearch($ClientPos[0] + 290, $ClientPos[1] + 293, $ClientPos[0] + 564, $ClientPos[1] + 294, 0x058AE1,10)
   If Not (@error) Then
	  MouseClick("left", $NoEncBlizzard[0],$NoEncBlizzard[1])
	  Sleep(200)
	  MouseClick("left", $NoEncBlizzard[0],$NoEncBlizzard[1])
	  Sleep(200)
	  ConsoleWrite("1")
	  ManaCheckIce()
	  Sleep(200)
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
		PixelSearch($ClientPos[0] + 339, $ClientPos[1] + 297, $ClientPos[0] + 339, $ClientPos[1] + 297, 0xE3D8CE,10)
		If Not @error Then
		   ConsoleWrite("3")
		   MouseClick("left",$ClientPos[0]+339,$ClientPos[1]+297)
		   Sleep(150)
		   MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,80)
		   Sleep(50)
		   ManaCheckIce()
			ConsoleWrite("Added 1 attack counter")
			Sleep(50)
		Else
			GuiCtrlSetData($StatusLabel,"In/Out Battle")
			MouseMove($ClientPos[0] + 408,$ClientPos[1] + 114,80)
			WinActivate("Wizard101")
			Opt("SendKeyDownDelay",650)
			Sleep(150)
			Send("w")
			Sleep(150)
			Send("s")
   EndIf
EndIf
   EndIf
   WEnd
EndFunc

Func Exit8()
Exit
EndFunc