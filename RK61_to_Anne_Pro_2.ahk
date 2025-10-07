; ============================================================
; Custom Keyboard Script (AHK v2)
; - Turns Win keys into Alt keys
; - Custom CapsLock behavior (WASD as arrows, etc.)
; ============================================================

; --- Make Windows keys behave like Alt ---
*LWin:: {
    Send("{LAlt down}")
}
*LWin up:: {
    Send("{LAlt up}")
}

*RWin:: {
    Send("{RAlt down}")
}
*RWin up:: {
    Send("{RAlt up}")
}

; ============================================================
; --- State Tracking ---
capsPressed := false
capsOtherKeyPressed := false

; --- Turn off default CapsLock behavior ---
SetCapsLockState("AlwaysOff")

; --- Disable default arrow keys (not from CapsLock) ---
Up::Send("/")           ; Up key types '/'
+Up::Send("?")          ; Shift + Up key types '?'
Left::Return            ; Left key disabled
Down::Return            ; Down key disabled  
Right::RCtrl            ; Right key becomes Right Ctrl

; --- Key Mappings (formatted one per line) ---
allowedKeys := Map(
    "1", "{F1}",
    "2", "{F2}",
    "3", "{F3}",
    "4", "{F4}",
    "5", "{F5}",
    "6", "{F6}",
    "7", "{F7}",
    "8", "{F8}",
    "9", "{F9}",
    "0", "{F10}",
    "-", "{F11}",
    "=", "{F12}",
    "w", "{Up}",
    "a", "{Left}",
    "s", "{Down}",
    "d", "{Right}",
    "p", "^{PrintScreen}",
    "Escape", "``"
)

; --- CapsLock key handling ---
CapsLock:: {
    global capsPressed := true
    global capsOtherKeyPressed := false
    SetTimer(CheckCapsLockRelease, 10)
}

CapsLock Up:: {
    global capsPressed, capsOtherKeyPressed
    SetTimer(CheckCapsLockRelease, 0)
    
    ; Safety: Release all arrow keys when CapsLock is released
    Send("{Up up}{Left up}{Down up}{Right up}")
    SetTimer(CheckWRelease, 0)
    SetTimer(CheckARelease, 0)
    SetTimer(CheckSRelease, 0)
    SetTimer(CheckDRelease, 0)
    
    if (!capsOtherKeyPressed) {
        ; Toggle actual CapsLock state
        if (GetKeyState("CapsLock", "T")) {
            SetCapsLockState("Off")
        } else {
            SetCapsLockState("On")
        }
    }
    capsPressed := false
    capsOtherKeyPressed := false
}

CheckCapsLockRelease() {
    global capsPressed, capsOtherKeyPressed
    if (!GetKeyState("CapsLock", "P")) {
        SetTimer(CheckCapsLockRelease, 0)
        capsPressed := false
        capsOtherKeyPressed := false
    }
}

HandleKey(key) {
    global capsOtherKeyPressed, allowedKeys
    capsOtherKeyPressed := true
    if allowedKeys.Has(key) {
        Send(allowedKeys[key])
    }
}

; --- CapsLock Combinations ---
#HotIf GetKeyState("CapsLock", "P")

; Letters - Special handling for WASD (arrow keys)
w:: {
    global capsOtherKeyPressed := true
    Send("{Up down}")
    SetTimer(CheckWRelease, 50)
}
w Up:: {
    Send("{Up up}")
    SetTimer(CheckWRelease, 0)
}

a:: {
    global capsOtherKeyPressed := true
    Send("{Left down}")
    SetTimer(CheckARelease, 50)
}
a Up:: {
    Send("{Left up}")
    SetTimer(CheckARelease, 0)
}

s:: {
    global capsOtherKeyPressed := true
    Send("{Down down}")
    SetTimer(CheckSRelease, 50)
}
s Up:: {
    Send("{Down up}")
    SetTimer(CheckSRelease, 0)
}

d:: {
    global capsOtherKeyPressed := true
    Send("{Right down}")
    SetTimer(CheckDRelease, 50)
}
d Up:: {
    Send("{Right up}")
    SetTimer(CheckDRelease, 0)
}

; Safety timers
CheckWRelease() {
    if (!GetKeyState("w", "P") || !GetKeyState("CapsLock", "P")) {
        Send("{Up up}")
        SetTimer(CheckWRelease, 0)
    }
}

CheckARelease() {
    if (!GetKeyState("a", "P") || !GetKeyState("CapsLock", "P")) {
        Send("{Left up}")
        SetTimer(CheckARelease, 0)
    }
}

CheckSRelease() {
    if (!GetKeyState("s", "P") || !GetKeyState("CapsLock", "P")) {
        Send("{Down up}")
        SetTimer(CheckSRelease, 0)
    }
}

CheckDRelease() {
    if (!GetKeyState("d", "P") || !GetKeyState("CapsLock", "P")) {
        Send("{Right up}")
        SetTimer(CheckDRelease, 0)
    }
}

; Other letters
b::HandleKey("b")
c::HandleKey("c")
e::HandleKey("e")
f::HandleKey("f")
g::HandleKey("g")
h::HandleKey("h")
i::HandleKey("i")
j::HandleKey("j")
k::HandleKey("k")
l::HandleKey("l")
m::HandleKey("m")
n::HandleKey("n")
o::HandleKey("o")
p::HandleKey("p")
q::HandleKey("q")
r::HandleKey("r")
t::HandleKey("t")
u::HandleKey("u")
v::HandleKey("v")
x::HandleKey("x")
y::HandleKey("y")
z::HandleKey("z")

; Numbers & symbols
1::HandleKey("1")
2::HandleKey("2")
3::HandleKey("3")
4::HandleKey("4")
5::HandleKey("5")
6::HandleKey("6")
7::HandleKey("7")
8::HandleKey("8")
9::HandleKey("9")
0::HandleKey("0")
-::HandleKey("-")
=::HandleKey("=")

; Function keys
F1::HandleKey("F1")
F2::HandleKey("F2")
F3::HandleKey("F3")
F4::HandleKey("F4")
F5::HandleKey("F5")
F6::HandleKey("F6")
F7::HandleKey("F7")
F8::HandleKey("F8")
F9::HandleKey("F9")
F10::HandleKey("F10")
F11::HandleKey("F11")
F12::HandleKey("F12")

; Punctuation
`;::HandleKey(";")
'::HandleKey("'")
,::HandleKey(",")
.::HandleKey(".")
/::HandleKey("/")
\::HandleKey("\")
[::HandleKey("[")
]::HandleKey("]")
`::HandleKey("~")

; Special
Escape::HandleKey("Escape")

; Special Arrow Handling under CapsLock
Up::Send("{Delete}")     ; CapsLock + Up = Delete
Left::Return
Down::Return
Right::Return

#HotIf  ; End CapsLock block
; ============================================================
