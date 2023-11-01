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
;RAlt & SC029::Send, {SC029}  ; backtick (`) to HUN layer:
Shift & SC029::Send, ~       ; tilde
;Shift & Escape::Send, ~       ; tilde on the real esc for K11

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
; One-note up down inly works with SendPlay
; Windows-terminal Alt+key only works woth send
	
MoveCursor_1(key) {
    shift 	:= GetKeyState("LSHIFT","P")  or GetKeyState("w","P")
    control := GetKeyState("LCONTROL","P") or GetKeyState("e","P")
	alt := GetKeyState("LALT","P")  or GetKeyState("f","P")
    controlShift := control && shift
    controlAlt := control && alt

    if controlShift {
        Send, ^+%key%
    }
    else if controlAlt {
        Send, ^!%key%
    }
	else if shift {
        Send, +%key%
        ;Send, {Shift down}{Left}{Shift up}
    }
    else if control {
        Send, ^%key%
    }
    else if alt {
        Send, !%key%
    }
    else {
        Send, %key%
    }

}

; KEYBOARD nav and
; 0->00B, '-'->00C, '='->00D, '['->01A, ']'->01B, ';'->027, '''->028, '\'->02B
;Tab::Send, {Tab}



	

;Tab:: ; Hotstring
;    KeyWait, Tab, T1 ; Wait 200 milliseconds
;    ;Cap := GetKeyState("Shift", "P") ; Determine if letter should be capitalized
;    Send, % (ErrorLevel ? "xHello" : "a") ; Send letter, or word/phrase
;return

;Tab::
;pressTime := A_TickCount
;While GetKeyState("Tab")
;	Continue
;KeyWait, Tab, L
;releaseTime := A_TickCount
;duration := releaseTime - pressTime
;ToolTip, %duration% xx %A_TimeSincePriorHotkey% %A_TimeSinceThisHotkey% %A_Thishotkey%
;Tooltip %pressTime% x %releaseTime% z %duration% y %A_TimeSinceThisHotkey%
;if(%duration%>1000)
;Send, axax
;else
;Send, Hello
;return

;Tab & w::LShift
;Tab & e::LControl
;Tab & f::LAlt

;; awsd style
;Tab & j::MoveCursor("{LEFT}")
;Tab & k::MoveCursor("{DOWN}")
;Tab & i::MoveCursor("{UP}")
;Tab & l::MoveCursor("{RIGHT}") ;;

;Tab & u::MoveCursor("{Home}")
;Tab & SC00A::MoveCursor("{End}")  ;;           xx
;Tab & SC009::MoveCursor("{Delete}") ;9
;Tab & SC027::MoveCursor("{PgDn}")  ; 0             xx
;Tab & p::MoveCursor("{PgUp}")     ; -

;Tab & k::MoveCursor("{LEFT}")
;Tab & l::MoveCursor("{DOWN}")
;Tab & o::MoveCursor("{UP}")
;Tab & SC027::MoveCursor("{RIGHT}") ;;

;Tab & i::MoveCursor("{Home}")
;Tab & p::MoveCursor("{End}")  ;;           xx
;Tab & SC00A::MoveCursor("{Delete}") ;9
;Tab & SC00B::MoveCursor("{PgDn}")  ; 0             xx
;Tab & SC00C::MoveCursor("{PgUp}")     ; -

;; kb nav with RAlt
RAlt & l::MoveCursor_1("{LEFT}")
RAlt & SC027::MoveCursor_1("{DOWN}")    ;;
RAlt & p::MoveCursor_1("{UP}")
RAlt & SC028::MoveCursor_1("{RIGHT}") ;'
	

RAlt & k::MoveCursor_1("{Delete}")
RAlt & o::MoveCursor_1("{Home}")  ;      xx
RAlt & i::MoveCursor_1("{Insert}") ; 
RAlt & SC01A::MoveCursor_1("{End}") ; [
RAlt & SC01B::MoveCursor_1("{PgUp}")     ; ]
RAlt & SC02B::MoveCursor_1("{PgDn}")  ; \             xx
RAlt & Enter::MoveCursor_1("{PgDn}")  ;

RAlt & SC002::MoveCursor_1("{SC03B}") ; 1->F1
RAlt & SC003::MoveCursor_1("{SC03C}") ; 2->F2
RAlt & SC004::MoveCursor_1("{SC03D}") ; 3->F3
RAlt & SC005::MoveCursor_1("{SC03E}") ; 4->F4
RAlt & SC006::MoveCursor_1("{SC03F}") ; 5->F5
RAlt & SC007::MoveCursor_1("{SC040}") ; 6->F6
RAlt & SC008::MoveCursor_1("{SC041}") ; 7->F7
RAlt & SC009::MoveCursor_1("{SC042}") ; 8->F8
RAlt & SC00A::MoveCursor_1("{SC043}") ; 9->F9
RAlt & SC00B::MoveCursor_1("{SC044}") ; 0->F10
RAlt & SC00C::MoveCursor_1("{SC057}") ; '-'->F11
RAlt & SC00D::MoveCursor_1("{SC058}") ; '='->F12

RAlt & BackSpace::MoveCursor("{Delete}") ;
;Tab & ,::MoveCursor("{Insert}")



;; TKL nav block
;; need to disable, messes up with KeyChrone - 
;Delete::MoveCursor("{Home}")  
;End::MoveCursor("{Insert}")  
;Home::MoveCursor("{End}")
;Insert::MoveCursor("{Delete}")
;;PgDn::MoveCursor("{End}") ;;

;LShift & Delete::MoveCursor("{Home}")  
;LShift & End::MoveCursor("{Insert}")  
;LShift & Home::MoveCursor("{End}")
;LShift & Insert::MoveCursor("{Delete}")

;Control & Delete::MoveCursor("{Home}")  
;Control & End::MoveCursor("{Insert}")  
;Control & Home::MoveCursor("{End}")
;Control & Insert::MoveCursor("{Delete}")

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
NumpadUp::End


NumpadLeft::Home
NumpadRight::PgDn
;NumpadLeft::MoveCursor("{Delete}")

NumpadSub::Escape
NumpadAdd::BackSpace



; ####### SYMBOLS  layer on TAB ##################################################
; 0->00B, '-'->00C, '='->00D, '['->01A, ']'->01B, ';'->027, '''->028, '\'->02B

; my own tab override to prevent accidentally sending a tab when searching too long for a symbol :) 
DoTab(){ 
    KeyWait, Tab, P
    ;Tooltip %duration% y %A_TimeSinceThisHotkey% p:%A_Priohotkey% t:%A_Thishotkey% b %A_Thishotkey%=="Tab"
    if(A_Thishotkey=="Tab" and A_TimeSinceThisHotkey<500)
	    Send, {Tab}
    else
        Send, {} 

}
ComboKey(key){ 
    KeyWait, %key%, P
	bool = %A_Thishotkey%==%key%
    Tooltip %key% k %duration% y %A_TimeSinceThisHotkey% p:%A_Priohotkey% t:%A_Thishotkey% b %bool%
    if(A_Thishotkey==key and A_TimeSinceThisHotkey<500)
	    Send, {%key%}
    else
        Send, {} 
}

;Tab::DoTab()
Tab::ComboKey("Tab")
;a::ComboKey("a")
a:: Send, a
SC027:: Send, {SC027} ; ;

; ~ to prevent disabling the standalone tab press
~Tab & q:: !
a &  q:: !
SC027 & q:: !

~Tab & w:: @
a &  w:: @
SC027 & w:: @

~Tab & e:: #
a &  e:: #
SC027 & e:: #

~Tab & r:: $
a &  r:: $
SC027 & r:: $

~Tab & t:: Send, {asc 037} ; %
a &  t:: Send, {asc 037} ; %
SC027 & t:: Send, {asc 037} ; %

~Tab & y:: ^
a &  y:: ^
SC027 & y:: ^

~Tab & u:: &
a &  u:: &
SC027 & u:: &

~Tab & i:: *
a &  i:: *
SC027 & i:: *

~Tab & o:: '
a &  o:: '
SC027 & o:: '

~Tab & p:: "
a &  p:: "
SC027 & p:: "

~Tab & a:: ~
;a &  a:: ~
SC027 & a:: ~

~Tab & z::Send, {``}  ; backtick
;a &  z::Send, {``}  ; backtick
SC027 & z::Send, {``}  ; backtick

~Tab & s:: {
a &  s:: {
SC027 & s:: {

~Tab & d:: [
a &  d:: [
SC027 & d:: [

~Tab & f:: ]
a &  f:: ]
SC027 & f:: ]

~Tab & g:: }
a &  g:: }
SC027 & g:: }

~Tab & c:: \
a &  c:: \
SC027 & c:: \

~Tab & v:: |
a &  v:: |
SC027 & v:: |

~Tab & b:: /
a &  b:: /
SC027 & b:: /

~Tab & h:: =
a &  h:: =
SC027 & h:: =

~Tab & j:: -
a &  j:: -
SC027 & j:: -

~Tab & k:: (
a &  k:: (
SC027 & k:: (

~Tab & l:: )
a &  l:: )
SC027 & l:: )

~Tab & SC027:: :
a &  SC027:: :
;SC027 & SC027:: :

~Tab & n:: +
a &  n:: +
SC027 & n:: +

~Tab & m:: _
a &  m:: _
SC027 & m:: _

~Tab & SC033:: <
a &  SC033:: <
SC027 & SC033:: <

~Tab & SC034:: >
a &  SC034:: >
SC027 & SC034:: >

~Tab & SC035:: ?
a &  SC035:: ?
SC027 & SC035:: ?



;Tab & q::Send, {``}  ; backtick
;Tab & Space::BackSpace
;Tab & SC06B::BackSpace

; for common coding symbols let tab functiona shift
~Tab & SC00C:: _
~Tab & SC00D:: +
~Tab & SC01A:: {
~Tab & SC01B:: } ;
;Tab & SC027:: :
~Tab & SC028:: "
~Tab & SC02B:: \


; ####### HUN language layer ##################################################
; using Space and/or AltGr for hun symbols
; ... however using space as modifier causes too many rolling key problems 
;     so disable space for now
 
RAlt:: Send, {}  ;; Prevent AltGr from toggleing menus 


Space::Send, {Space}

Space & SC002::Send, ű        ; 1
Space & x::Send, ű        ; 
Space & SC003::Send, á        ; 2
Space & SC004::Send, ó        ; 3
Space & SC005::Send, ű        ; 4
Space & w::Send, ü        ; 
Space & q::Send, y        ; 
;--
Space & SC009::Send, ú        ; 8
Space & SC00A::Send, í        ; 9
Space & SC00B::Send, ö        ; 0 - ori hu place
Space & SC00C::Send, ú        ; -
Space & SC01A::Send, ő        ; [
Space & SC027::Send, é        ; ; - ori hu place

#If GetKeyState("Shift", "P")

	Space & SC002::Send, Ű        ; 1
	Space & x::Send, Ű        ; 
	Space & SC003::Send, Á        ; 2
	Space & SC004::Send, Ó        ; 3
	Space & SC005::Send, Ű        ; 4
	Space & w::Send, Ü        ; 
	Space & q::Send, Y        ; 
	;--
	Space & SC009::Send, Ú        ; 8
	Space & SC00A::Send, Í        ; 9
	Space & SC00B::Send, Ö        ; 0
	Space & SC00C::Send, Ú        ; -
	Space & SC01A::Send, Ő        ; [
	Space & SC027::Send, É        ; ; - ori hu place

#If

;SC06B F20

SC06B & SC002::Send, ű        ; 1
SC06B & x::Send, ű        ; 
SC06B & SC003::Send, á        ; 2
SC06B & SC004::Send, ó        ; 3
SC06B & SC005::Send, ű        ; 4
SC06B & w::Send, ü        ; 
SC06B & q::Send, y        ; 
;--
SC06B & SC009::Send, ú        ; 7
SC06B & SC00A::Send, í        ; 8
SC06B & SC00B::Send, ö        ; 0 - ori hu place
SC06B & SC01A::Send, ő        ; [
SC06B & SC027::Send, é        ; ; - ori hu place

#If GetKeyState("Shift", "P")

	SC06B & SC002::Send, Ű        ; 1
	SC06B & x::Send, Ű        ; 
	SC06B & SC003::Send, Á        ; 2
	SC06B & SC004::Send, Ó        ; 3
	SC06B & SC005::Send, Ű        ; 4
	SC06B & w::Send, Ü        ; 
	SC06B & q::Send, Y        ; 
	;--
	SC06B & SC009::Send, Ú        ; 7
	SC06B & SC00A::Send, Í        ; 8
	SC06B & SC00B::Send, Ö        ; 9
	SC06B & SC01A::Send, Ő        ; [
	SC06B & SC027::Send, É        ; ; - ori hu place

#If

;;AltGr & a::á
:*:hu_4u::ű
:*:hu_2a::á
:*:hu_2o::ó
:*:hu_3o::ö
:*:hu_4o::ő

:*:'#@a::á
