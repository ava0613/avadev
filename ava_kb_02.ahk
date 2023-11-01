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

; ####### Navigation layer #################################################

;RWin::AppsKey
;AppsKey::RWin

stdout := FileOpen("*", "w")
stdout.WriteLine("line 2")

global navon := false
stdout.WriteLine(navon)

ToggleNav() {
	navon := !navon
}

RControl:: ToggleNav()

NavOrKey(key, action) {
    shift := GetKeyState("LSHIFT","P")
    control := GetKeyState("LCONTROL","P")
	alt := GetKeyState("LALT","P")
    controlShift := control && shift

	if navon {
		if controlShift {
			SendPlay, ^+%action%
		}
		else if shift {
			SendPlay, +%action%
		}
		else if control {
			SendPlay, ^%action%
		}
		else if alt {
			SendPlay, !%action%
		}
		else {
			SendPlay, %action%
		}
	} else {
		SendPlay, %key%
	}
	
}
;;k:: NavOrKey("k", "{HOME}")
;;l:: NavOrKey("l", "{PgDn}")
;;SC027:: NavOrKey(";", "{PgUp}")
;;SC028:: NavOrKey("'", "{End}")

;;m:: NavOrKey("m", "{LEFT}")
;;,:: NavOrKey(",", "{DOWN}")
;;.:: NavOrKey(".", "{UP}")
;;/:: NavOrKey("/", "{RIGHT}")

;;LShift & m:: NavOrKey("{RShift}", "{LEFT}")
;;LShift & ,:: NavOrKey("<", "{DOWN}")
;;LShift & .:: NavOrKey(">", "{UP}")
;;LShift & /:: NavOrKey("?", "{RIGHT}")



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
		;SendPlay, %key% ;; SendPlay does not work within powershell
        Send, %key%
    }

}

Tab::Send, {Tab}
;;Tab & Space::BackSpace
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
Tab & SC01A::MoveCursor("{PgUp}")     ;[
Tab & SC028::MoveCursor("{PgDn}")  ;'

Tab & ,::MoveCursor("{Insert}")
Tab & m::MoveCursor("{Delete}")
Tab & j::BackSpace

Tab & Space::MoveCursor("{Space}")


;; awsd style
AppsKey & k::MoveCursor("{LEFT}")  
AppsKey & l::MoveCursor("{DOWN}")  
AppsKey & o::MoveCursor("{UP}") 
AppsKey & SC027::MoveCursor("{RIGHT}") ;;

AppsKey & i::MoveCursor("{Home}")
AppsKey & p::MoveCursor("{End}")  ;;
AppsKey & SC01A::MoveCursor("{PgUp}")     ;[
AppsKey & SC028::MoveCursor("{PgDn}")  ;'

AppsKey & ,::MoveCursor("{Insert}")
AppsKey & m::MoveCursor("{Delete}")

;; TKL nav block
;Delete::MoveCursor("{Delete}")  
End::MoveCursor("{Insert}")  
Home::MoveCursor("{PgUp}") 
;PgDn::MoveCursor("{PgDn}") ;;
Insert::MoveCursor("{Home}")
PgUp::MoveCursor("{End}")  ;;
;PgUp::MoveCursor("{SC14F}")  ;;


Tab & Delete::MoveCursor("{LEFT}")  
Tab & End::MoveCursor("{DOWN}")  
Tab & Home::MoveCursor("{UP}") 
Tab & PgDn::MoveCursor("{RIGHT}") ;;
Tab & Insert::MoveCursor("{Home}")
Tab & PgUp::MoveCursor("{End}")  ;;

AppsKey & Delete::MoveCursor("{Delete}")  
AppsKey & End::MoveCursor("{End}")  
AppsKey & Home::MoveCursor("{Home}") 
AppsKey & PgDn::MoveCursor("{PgDn}") ;;
AppsKey & Insert::MoveCursor("{Insert}")
AppsKey & PgUp::MoveCursor("{PgUp}")  ;;

;;Left & Delete::MoveCursor("{LEFT}")  
;;Left & End::MoveCursor("{DOWN}")  
;;Left & Home::MoveCursor("{UP}") 
;;Left & PgDn::MoveCursor("{RIGHT}") ;;
;;Left & Insert::MoveCursor("{Home}")
;;Left & PgUp::MoveCursor("{End}")  ;;


;;AppsKey & ,::MoveCursor("{LEFT}")  ;,
;;AppsKey & .::MoveCursor("{DOWN}")  ;.
;;AppsKey & l::MoveCursor("{UP}")
;;AppsKey & /::MoveCursor("{RIGHT}")

;;AppsKey & p::MoveCursor("{Home}")
;;AppsKey & SC027::MoveCursor("{End}")  ;;
;;AppsKey & SC01A::MoveCursor("{PgUp}")     ;[
;;AppsKey & SC028::MoveCursor("{PgDn}")  ;'

;;AppsKey & k::MoveCursor("{Insert}")
;;AppsKey & m::MoveCursor("{Delete}")



;; same with rhift - more comfortable,
;; but two shifts do not work on some keys
;;RShift & ,::MoveCursor("{LEFT}")  ;,
;;RShift & .::MoveCursor("{DOWN}")  ;.
;;RShift & l::MoveCursor("{UP}")
;;RShift & /::MoveCursor("{RIGHT}")

;;RShift & p::MoveCursor("{Home}")
;;RShift & SC027::MoveCursor("{End}")  ;;
;;RShift & SC01A::MoveCursor("{PgUp}")     ;[
;;RShift & SC028::MoveCursor("{PgDn}")  ;'

;;RShift & k::MoveCursor("{Insert}")
;;RShift & m::MoveCursor("{Delete}")

;;RAlt & ,::MoveCursor("{LEFT}")  ;,
;;RAlt & .::MoveCursor("{DOWN}")  ;.
;;RAlt & l::MoveCursor("{UP}")
;;RAlt & /::MoveCursor("{RIGHT}")

;;RAlt & p::MoveCursor("{Home}")
;;RAlt & SC027::MoveCursor("{End}")  ;;
;;RAlt & SC01A::MoveCursor("{PgUp}")     ;[
;;RAlt & SC028::MoveCursor("{PgDn}")  ;'

;;RAlt & k::MoveCursor("{Insert}")
;;RAlt & m::MoveCursor("{Delete}")


; prevent capslock to go to toggles state

;;CapsLock up::
;;	SetCapsLockState, off
;;return
;;Alt & CapsLock:: ; disable
;;Shift & CapsLock:: ; disable
;;Control & CapsLock:: ; disable
;;LWin & CapsLock:: ; disable
;;RWin & CapsLock:: ; disable



;;;Tab & k::Left
;;;Tab & SC028::Right      ; ' only works with key code
; plain send does not work for OneNote, need to use SendPlay
; https://newbedev.com/up-down-key-not-working-in-onenote-2016-for-autohotkey
;;;Tab & l::SendPlay, {Down}  ; to make sendPlay work run it with "Run with ui access"  (context menu)
;;;Tab & SC027::SendPlay, {Up}   ;  ; only works with key code

		
;;;Tab & i::Home
;;;Tab & o::PgDn
;;;Tab & p::PgUp
;;;Tab & SC01A::End        ; [ only works with key code

;;CapsLock & SC01B::Escape     ; [ only works with key code
;;CapsLock & SC02B::Enter      ; \ only works with key code


;;CapsLock & m::Delete
;;CapsLock & SC033::Insert     ; , only works with key code

;#If GetKeyState("CapsLock", "P") and GetKeyState("a", "P")
;	y::Send, {Control down}{Left down}{Control up}{Left up}
;#If
	
;;CapsLock & d::return
;;#If GetKeyState("CapsLock", "P")
;;	d & k::Send {Control down}{Shift down}{Left down}{Control up}{Shift up}{Left up}
;;	d & SC028::Send {Control down}{Shift down}{Right down}{Control up}{Shift up}{Right up}
;;	d & l::Send {Shift down}{Down down}{Shift up}{Down up}
;;	d & SC027::Send {Shift down}{Up down}{Shift up}{Up up}
;;#If




;SC056 & Space::_            ; screws with ishift

;CapsLock & Space::Send, {BackSpace} 
;return

;##### numpad navigation

NumpadEnd::LEFT 
NumpadPgDn::RIGHT

# Up and Down aer more tricky because of onenote and vnc
NumpadDown::SendPlay, {DOWN}  ; not working in vnc
LShift & NumpadDown::SendPlay, {Shift down}{DOWN}{Shift up} ; beacause of onenote
NumpadClear::SendPlay, {UP}
LShift & NumpadClear::SendPlay, {Shift down}{UP}{Shift up} ; beacause of onenote

NumpadHome::Home
NumpadPgUp::End
NumpadUp::PgUp
NumpadRight::PgDn

NumpadLeft::Delete
;NumpadLeft::MoveCursor("{Delete}")


; ####### SYMBOLS  layer ##################################################
; on CapsLock and left alt

; prevent capslock to go to toggles state
;;SetCapsLockState, AlwaysOff
CapsLock up::
	SetCapsLockState, off
	SetCapsLockState, AlwaysOff
return
Alt & CapsLock:: ; disable
Shift & CapsLock:: ; disable
Control & CapsLock:: ; disable
LWin & CapsLock:: ; disable
RWin & CapsLock:: ; disable



;;            q    w    e    r    t       y    u    i    o    p    [    ]    ret   
;;  ~`        !    @    #    $    %       ^    &    *    (    )    -_   =+   bck
;;                                                            [{   ]}   ret
;;                                                       ;:   '"   \|
;;                                             ,<   .>   /?   rsft
;; i
;;            a    s    d    f    g       h    j    k    l    ;    '    \
;;(deflayer symbols
;;  _         _    _    _    _    _       _    _    _    _    _    _    _    _
;;  _         !    @    #    $    %       >    *    \(   \)   \    =    |    ret  
;;  _         ~    /    ^    XX   &       =    +    [    ]    <    >    |
;;  _    _    `    XX   XX   XX   XX      <    -    {    }    /    rsft
;;  _    _    _    _              \_             _    _    _
;;)
;;(deflayer symbols
;;  _         _    _    _    _    _       _    _    _    _    _    _    _    _
;;  _         !    @    #    $    %       _    _    *    (    )    {    }    ret  
;;  xx        `    ~    ^    &    _       _    +    \_    _   :    "    |
;;  _    _    _    _    _    _    _       _    =    <    >    ?    rsft
;;  _    _    _    _              _             _    _    _
;;)

;;\:: Send, \  ;; \ alone is \

CapsLock & Space::BackSpace



CapsLock & q::Send, {`!}        ; 
CapsLock & w::Send, @
CapsLock & e::Send, {`#}
CapsLock & r::Send, $
CapsLock & t::Send, {`%} ; %
CapsLock & u::Send, *
CapsLock & i::Send, =
CapsLock & o::Send, (
CapsLock & p::Send, )
CapsLock & SC01A::Send, {`{}    ; [
CapsLock & SC01B::Send, {`}}    ; ] 
CapsLock & a::Send, {``}
CapsLock & s::Send, ~
CapsLock & d::Send, {`^}
CapsLock & f::Send, &
CapsLock & j::Send, {`+}
CapsLock & k::Send, -
CapsLock & l::Send, l
CapsLock & SC027::Send, :  ;   ;
CapsLock & SC028::Send, "  ;   '   
CapsLock & \::Send, |
CapsLock & m::Send, _
CapsLock & ,::Send, <
CapsLock & .::Send, >
CapsLock & /::Send, ?

RAlt & q::Send, {`!}        ; 
RAlt & w::Send, @
RAlt & e::Send, {`#}
RAlt & r::Send, $
RAlt & t::Send, {`%} ; %
RAlt & u::Send, *
RAlt & i::Send, =
RAlt & o::Send, (
RAlt & p::Send, )
RAlt & SC01A::Send, {`{}    ; [
RAlt & SC01B::Send, {`}}    ; ] 
RAlt & a::Send, {``}
RAlt & s::Send, ~
RAlt & d::Send, {`^}
RAlt & f::Send, &
RAlt & j::Send, {`+}
RAlt & k::Send, -
RAlt & l::Send, l
RAlt & SC027::Send, :  ;   ;
RAlt & SC028::Send, "  ;   '   
RAlt & \::Send, |
RAlt & m::Send, _
RAlt & ,::Send, <
RAlt & .::Send, >
RAlt & /::Send, ?



; ####### HUN language layer ##################################################
; using Space and/or AltGr for hun symbols
; ... however using space as modifier causes too many rolling key problems 
;     so disable space for now
 
RAlt:: Send, {}  ;; Prevent AltGr from toggleing menus 
;Space:: Send, {Space}  ;; Space alone is space

; 'rotate' qyz one step coutnerclockwise 
; this is due to two factors
; - in programmer mode left home pos is kl;' , so ansi y keq is pretty unreachable, we need a key there that is rarely used in both english and hungarian
; - in iso hu layout y is on ansi z, it is useful to keep it there
;y::z      
;z::y

;s:: Send, s  ;; s alone is s
;s & d::Send, sz

;RAlt & q::Send, y        ; 
;RAlt & w::Send, ü
;RAlt & e::Send, é
;RAlt & r::Send, r
;RAlt & t::Send, t
;RAlt & y::Send, z      
;RAlt & u::Send, ú
;RAlt & i::Send, í
;RAlt & o::Send, ó
;RAlt & p::Send, p
;RAlt & SC01A::Send, ő    ; [
;RAlt & SC01B::Send, ő    ; ]  - pinky is imprecise, so both [] will press ő
;RAlt & ]::Send, ]
;RAlt & a::Send, á
;RAlt & s::Send, s
;RAlt & d::Send, d
;RAlt & f::Send, f
;RAlt & g::Send, g
;RAlt & h::Send, h
;RAlt & j::Send, j
;RAlt & k::Send, k
;RAlt & l::Send, l
;RAlt & SC027::Send, ö  ;   ;
;RAlt & 0::Send, ö      ;   0 also ö
;RAlt & SC028::Send, ú  ;   '   - pinky is imprecise, so both [] will press ó
;RAlt & '::Send, '
;RAlt & \::Send, \
;RAlt & z::Send, z
;RAlt & x::Send, ű
;RAlt & c::Send, c
;RAlt & v::Send, v
;RAlt & b::Send, b
;RAlt & n::Send, n
;RAlt & m::Send, m
;RAlt & ,::Send, ,
;RAlt & .::Send, .
;RAlt & /::Send, /

Space::Send, {Space}
;Space & q::Send, y        ; 
;Space & w::Send, w ;ü
;Space & e::Send, e ;é
;Space & r::Send, r
;Space & t::Send, t
;Space & y::Send, z      
;Space & u::Send, u ;ú
;Space & i::Send, i ;í
;Space & o::Send, o; ó
;Space & p::Send, p
;Space & SC01A::Send, ő    ; [
;Space & SC01B::Send, ő    ; ]  - pinky is imprecise, so both [] will press ő
;Space & ]::Send, ]
;Space & a::Send, a ;á
;Space & s::Send, s
;Space & d::Send, d
;Space & f::Send, f
;Space & g::Send, g
;Space & h::Send, h
;Space & j::Send, j
;Space & k::Send, k
;Space & l::Send, l
;;Space & SC027::Send, ö  ;   ;
;;Space & 0::Send, ö      ;   0 also ö
;;Space & SC028::Send, ú  ;   '   - pinky is imprecise, so both [] will press ó
;Space & '::Send, '
;Space & \::Send, \
;Space & z::Send, z
;Space & x::Send, x ;ű
;Space & c::Send, c
;Space & v::Send, v
;Space & b::Send, b
;Space & n::Send, n
;Space & m::Send, m
;Space & ,::Send, ,
;Space & .::Send, .
;Space & /::Send, /


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
