#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; SUGGESTED for VNI;C issue, nut not working;
;#InstallKeybdHook
;#UseHook


;LShift & Space::_             ; for snake_case_programming
; #######  
;;SC056::LShift                 ; ISO left \ to shift

; relocate escape, 
SC029::Escape
RAlt & SC029::Send, {SC029}  ; backtick (`) to HUN layer:
Shift & SC029::Send, ~       ; tilde

; use CapsLock for Control
CapsLock::Control
CapsLock up::  ; prevent capslock to go to toggles state
	SetCapsLockState, off
	SetCapsLockState, AlwaysOff
	Send {Control up}
return
Alt & CapsLock:: ; disable
Shift & CapsLock:: ; disable
Control & CapsLock:: ; disable
LWin & CapsLock:: ; disable
RWin & CapsLock:: ; disable
SetCapsLockState, AlwaysOff

; ####### Navigation layer #################################################



MoveCursor(key) {
    shift 	:= GetKeyState("LSHIFT","P")  or GetKeyState("w","P")
    control := GetKeyState("LCONTROL","P") or GetKeyState("e","P")
	alt := GetKeyState("LALT","P")  or GetKeyState("f","P")
    controlShift := control && shift
    controlAlt := control && alt

    if controlShift {
        SendPlay, ^+%key%
    }
    else if controlAlt {
        SendPlay, ^!%key%
    }
	else if shift {
        SendPlay, +%key%
        ;Send, {Shift down}{Left}{Shift up}
    }
    else if control {
        SendPlay, ^%key%
    }
    else if alt {
        SendPlay, !%key%
    }
    else {
        SendPlay, %key%
    }

}

; KEYBOARD nav and 
Tab::Send, {Tab}

Tab & w::LShift
Tab & e::LControl
Tab & f::LAlt

;; awsd style
Tab & k::MoveCursor("{LEFT}")  
Tab & l::MoveCursor("{DOWN}")  
Tab & o::MoveCursor("{UP}") 
Tab & SC027::MoveCursor("{RIGHT}") ;;

Tab & i::MoveCursor("{Home}")
Tab & p::MoveCursor("{End}")  ;;
Tab & SC00C::MoveCursor("{PgUp}")     ; -
Tab & SC00B::MoveCursor("{PgDn}")  ; 0
Tab & SC00A::MoveCursor("{Delete}") ;9



;Tab & ,::MoveCursor("{Insert}")



;; TKL nav block
Delete::MoveCursor("{Home}")  
End::MoveCursor("{Insert}")  
Home::MoveCursor("{PgDn}") 
PgDn::MoveCursor("{End}") ;;
Insert::MoveCursor("{Delete}")

;##### numpad navigation

NumpadEnd::LEFT 
NumpadPgDn::RIGHT
;NumpadPgDn::Send, {RIGHT}

; Up and Down aer more tricky because of onenote and vnc
;NumpadDown::SendPlay, {DOWN}  ; not working in vnc
NumpadDown::Send, {DOWN}   ; works in powerhell
LShift & NumpadDown::SendPlay, {Shift down}{DOWN}{Shift up} ; beacause of onenote
;NumpadClear::SendPlay, {UP}
NumpadClear::Send, {UP}  ; works in powerhell
LShift & NumpadClear::SendPlay, {Shift down}{UP}{Shift up} ; beacause of onenote

NumpadHome::Delete
;NumpadPgUp::End
NumpadUp::PgDn


NumpadLeft::Home
NumpadRight::End
;NumpadLeft::MoveCursor("{Delete}")

NumpadSub::Escape
NumpadAdd::BackSpace



; ####### SYMBOLS  layer ##################################################


; some symbols on tab 
Tab & SC01A:: (
Tab & SC01B:: ) ;
Tab & q::Send, {``}  ; backtick
Tab & Space::BackSpace



; ####### HUN language layer ##################################################
; using Space and/or AltGr for hun symbols
; ... however using space as modifier causes too many rolling key problems 
;     so disable space for now
 
RAlt:: Send, {}  ;; Prevent AltGr from toggleing menus 


Space::Send, {Space}

Space & SC002::Send, ű        ; 1
Space & SC003::Send, á        ; 2
Space & SC004::Send, ó        ; 3
Space & SC005::Send, ű        ; 4
Space & w::Send, ü        ; 
Space & q::Send, y        ; 
;--
Space & SC009::Send, ú        ; 7
Space & SC00A::Send, í        ; 8
Space & SC00B::Send, ö        ; 9 - ori hu place
Space & SC01A::Send, ő        ; [
Space & SC027::Send, é        ; ; - ori hu place

#If GetKeyState("Shift", "P")

	Space & SC002::Send, Ű        ; 1
	Space & SC003::Send, Á        ; 2
	Space & SC004::Send, Ó        ; 3
	Space & SC005::Send, Ű        ; 4
	Space & w::Send, Ü        ; 
	Space & q::Send, Y        ; 
	;--
	Space & SC009::Send, Ú        ; 7
	Space & SC00A::Send, Í        ; 8
	Space & SC00B::Send, Ö        ; 9
	Space & SC01A::Send, Ő        ; [
	Space & SC027::Send, É        ; ; - ori hu place

#If





;;AltGr & a::á
