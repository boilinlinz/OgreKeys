#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;	#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force ;Necessary for hiding the dialog box when relaunching script.
DetectHiddenWindows, On	
;SetCapslockState, AlwaysOff ;Must only be used by one script at a time

/* 
Autohotkey testing
Mission: create a script that 
runs a separate script when caps lock is on
*/

;msgbox, running 1
;/*
i::up
j::left
k::down
l::right
u::Pgup
o::Pgdn
;*/
;CapsLock::Run, 2Layer_2.ahk
