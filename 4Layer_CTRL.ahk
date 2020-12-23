#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Project specific declarations below
#SingleInstance Force ;Necessary for hiding the dialog box when relaunching script.
DetectHiddenWindows, On
;SetCapslockState, AlwaysOff ; Enable if you don't need indicator light

/* 


This is the Parent script 
It uses the CapsLock key to control which child scripts run
The child scripts contain the desired layouts/layers


*/

;Variables for Suspend codes for PostMessage
WM_COMMAND := 0x111  
ID_FILE_SUSPEND := 65404

;Runs the layer automatically then Toggles the script using the suspend command
Run, 1Layer_1.ahk
PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, C:\Users\Dang\Desktop\Autohotkey Scripts\1Layer_1.ahk ahk_class AutoHotkey
SetCapslockState, ON

CapsLock_press := 1 ; Keeps track of CapsLock presses
~CapsLock::
PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, C:\Users\Dang\Desktop\Autohotkey Scripts\1Layer_1.ahk ahk_class AutoHotkey
CapsLock_press++
return





; Obsolete code below. Inefficient, enable at your own risk
/*
~CapsLock::
if (Mod(CapsLock_press, 2) = 0 ) ;Toggles layer 
{
Run, 1Layer_1.ahk
;MsgBox, on %CapsLock_press%
}
else 
{
PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, C:\Users\Dang\Desktop\Autohotkey Scripts\1Layer_1.ahk ahk_class AutoHotkey
;Msgbox, off
}
return
*/
