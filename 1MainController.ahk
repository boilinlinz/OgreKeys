﻿/* 
This is the Parent script 
It uses the CapsLock key to control which child scripts run
The child scripts contain the desired layouts/layers
 
Right now, there is only one child for navigation since I'm still afraid to 
remap other keys aside from capslock

Autohotkey testing
Mission: create a script that 
runs a separate script when caps lock is on
*/
; ------------------------------------------------------
/*
 ---------------------- Todo list ----------------------
1 - Add a faster cursor movement (shift boost) - DONE
2 - Make script autorun when windows startup - No automatic solution, Use windows functionality instead
3 - Put reload tooltip to the top - Done, timing is meh
4 - shift backspace delete key - DONE 
5 - Tooltip time show  - DONE
9 - turn the time display into a function for readability  - DONE
6 - Automate the resolution - DONE		
11- True spacebar CTRL functionality - DONE, still needs work with remapped keys, also with caps lock indicator

7 - Add ability to invert mouse behavior (speed)
8 - Display wpm/ bonggo cat drumming when typing  (Kaomoji, also can be animated?)
10 - enable mouse drag
12 - if typing, disable mouse - Not sure if worth adding since would make games weird
13 - Add return functionality for Shift Enter - Not easily achievable keylist has no return
14 - enable administrator rights when running to be able to control task manager
15 - reconstruct tell_time() to become more modular (for todo #8)
*/

;-----------------Configuration - Setup the variables before using the script! --------------------
; Display resolution
resolution_width := A_ScreenWidth ; Override if tooltip is placed incorrectly
resolution_height := A_ScreenHeight ;Tooltip should be beside the minimize button

; Location of layer scripts
Layer_1 := "C:\Users\Dang\Desktop\Autohotkey Scripts\1Layer_1.ahk"
;Layer_2 := ""

; ToolTip Settings - Change these if you want to change tooltip location
CoordMode, ToolTip ; Disable if you want window-dependent tooltip
tooltip_LocX := resolution_width-(resolution_width/6.5)
tooltip_LocY := 1.8
tooltip_Duration := -4000 ;Default -400, negative values in Seconds * 100,  Make sure to enable disappearing tooltip

; This script can be started when windows starts by 
; 1. Creating shortcut of script titled "shortcut"
; 2. Pasting it in %appdata%\Microsoft\Windows\Start Menu\Programs\Startup
; 3. or %programdata%\Microsoft\Windows\Start Menu\Programs\Startup    ;for all users

; The .ahk files must be edited and saved as UTF 8 -BOM for unicode keys (Mostly just emojis xD)

;-----------------------------------END OF CONFIGURATION --------------------------------------

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Project specific declarations below
#SingleInstance Force ;Necessary for hiding the dialog box when relaunching script.
DetectHiddenWindows, On
;SetCapslockState, AlwaysOff ; Enable if you don't need indicator light

; PostMessage variables for Suspending scripts, do not edit! 
WM_COMMAND := 0x111  
ID_FILE_SUSPEND := 65404

; Execute these upon running the script
SetCapslockState, ON
Run, %Layer_1%
PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, %Layer_1% ahk_class AutoHotkey ; Suspends Layer Script

Loop ; Displays time every 5 minutes then sleeps for another 5 minutes
{
	minute_counter :=
	FormatTime, minute_counter, ,m
	if (Mod(minute_counter, 5) = 0)
		{
		tell_time(2, 4) ;Amount of repetitions, see function for details
		capslock_status := GetKeyState("CapsLock", "T")
		if (capslock_status = 1)
			{
			layer_tooltip("Navigation")
			}
		else 
			{ 
			layer_tooltip("    (◕ᴥ◕)    ")
			
			}
		Sleep, 292000 ; Takes effect as soon as SetTimer is called, not when it ends.
		}
}

;Reloads script for emergency purposes ; Loops after this hotkey doesn't work, don't know why
^`:: ;Ctrl + ` (tilde key)	
Reload 
ToolTip -reloaded-, %tooltip_LocX% , %tooltip_LocY%
SetTimer, remove_tooltip, %tooltip_Duration%
return

CapsLock_press := 0 ; Keeps track of CapsLock presses *
CapsLock::
	CapsLock_press++
	PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, %Layer_1%ahk_class AutoHotkey
	if (Mod(CapsLock_press, 2) = 0) 
		{
			SetCapslockState, On
			layer_tooltip("Navigation")  
			;SetTimer, remove_tooltip, %tooltip_Duration% ; Enable for disappearing tooltip
		}
	else
		{
			SetCapslockState, Off
			layer_tooltip("    (◕ᴥ◕)    " )   ;Enable to show typing tooltip, disable line below 
			;layer_tooltip("")   ;I prefer it not showing :) 			
			;SetTimer, remove_tooltip, %tooltip_Duration% ;Enable for disappearing tooltip
		}
return

; Built-in Remaps - These keys are permanently remapped while the main script is active
\::BackSpace ;For ANSI layouts, imitates HHKB backspace layout 
BackSpace::\
+\::Send {Del} ; Additional backspace behaviour, Shift backspace = del
;+BackSpace::Del ;Not working, not sure why, supposed to remap shift + backspace to del

; Functions
tell_time(func_loop, anim_loop)
{
	;Put as many emoji frames you like
	;;;;;---------|--------------|
	emoji_1 := "     -_-      "
	emoji_2 := "  〇^-^ )o  "
	emoji_3 := "  o( ^-^〇  "
	emoji_4 := "               "
	emoji_5 := "               "
	emoji_6 := "               "
	emoji_7 := "               "
	emoji_8 := "               "
	emoji_9 := "               " ;You may copy this and name it to emoji_10 and so on to add frames
	tooltip_Duration := -2000 ;2 sec
	animation_rate :=  200	;in milliseconds, rate of frames/s, 250 for 24fps
	time_now := "" ; Store current time 
	FormatTime, time_now,  , Time
	ABStooltip_Duration := Abs(tooltip_Duration)
	Loop, %func_loop%
	{
		layer_tooltip("   " time_now "   " ) 
		Sleep, %ABStooltip_Duration%
		Loop, %anim_loop%
		{
			;layer_tooltip(emoji_1) 	; Enable these (layer_tooltip and the line below, sleep, for every frame u want to include) 
			;Sleep, %animation_rate% ; make sure to activate according to emoji_X u want to activate
			layer_tooltip(emoji_2)
			Sleep, %animation_rate%
			layer_tooltip(emoji_3)	
			Sleep, %animation_rate%
			;layer_tooltip(emoji_4)	
			;Sleep, %animation_rate%
			;layer_tooltip(emoji_5)	
			;Sleep, %animation_rate%
			;layer_tooltip(emoji_6)	
			;Sleep, %animation_rate%
			;layer_tooltip(emoji_7)	
			;Sleep, %animation_rate%
			;layer_tooltip(emoji_8)	
			;Sleep, %animation_rate%
			;layer_tooltip(emoji_9)	
		 	;Sleep, %animation_rate%
		}
	}
	;SetTimer, remove_tooltip
}

layer_tooltip(message_new) ; Tooltip function for readability
{ 
	global tooltip_LocX, tooltip_LocY
	ToolTip, %message_new%, %tooltip_LocX% , %tooltip_LocY%
	return
}
; Labels
remove_tooltip:
ToolTip
return