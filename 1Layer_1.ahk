#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;	#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force ;Necessary for hiding the dialog box when relaunching script.
DetectHiddenWindows, On	
;SetCapslockState, AlwaysOff ;Must only be used by one script at a time


; Navigation hotkeys
; 1. Arrows
i::up
j::left
k::down
l::right
u::Pgup
o::Pgdn

; 2 .       Mouse Controls
+f::MouseMove, 15, 0, 20, R
+s::MouseMove, -15, 0, 20, R
+d::MouseMove, 0, 15, 20, R
+e::MouseMove, 0, -15, 20, R
f::MouseMove, 100, 0, 20, R
s::MouseMove, -100, 0, 20, R
d::MouseMove, 0, 100, 20, R
e::MouseMove, 0, -100, 20, R

w::SendEvent {Blind}{LButton} ; Left click
r::SendEvent {Blind}{RButton} ; Right click


;/*
;3.		Alt tab and ctrl windows + arrows replaced by spacebar
space & j::Send {Blind}#^{left}
space & l::Send {Blind}#^{right}
space & i::Send {Blind}#^{up}
space & k::Send {Blind}#^{down}
space & Tab::Send {Blind}!{Tab}
space & u:: Send  ^{Pgup}
space & o:: Send  ^{Pgdn}	
;*/


; 4.  HHKB-style backspace behaviour
+BackSpace::Send {Del}

;Number row to Function row
1::f1
2::f2
3::f3
4::f4
5::f5
6::f6
7::f7
8::f8
9::f9
0::f10

;Disable Other keys for this layer
