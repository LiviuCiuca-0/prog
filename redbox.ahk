#Persistent
#SingleInstance Force
SetDefaultMouseSpeed, 0
SetKeyDelay, 50, 50
SetMouseDelay, 50

running := false
loopCount := 0

F4:: ; Start
if (!running) {
    running := true
    
    SetTimer, FoxholeLoop, 10
}
return

F6:: 
running := false
return

FoxholeLoop:
SetTimer, FoxholeLoop, Off  ; Prevent overlap


loopCount++
if (loopCount > 2)
    loopCount := 1


; Step 1 - Shift+E


;MsgBox, Loop %loopCount% 
; Step 2 - Alternate click

if (loopCount = 1) {
    Send, +{e}      ; Shift + E
    Sleep, 500     ; Wait 1 second
    Click, 1412, 780
} else if (loopCount = 2) {
    Send, +{e}
    Sleep, 500
    Click, 1412, 811
}


Sleep, 200

; Step 3

Click, 506, 602
Sleep, 200

; Step 4 - Shift+Click 9 times
Loop, 9 {
    
    SendInput, {Shift down}
    Click, 1588, 300
    SendInput, {Shift up}
    Sleep, 2000
}

; Step 5

Click, 551, 608
Sleep, 200

; Step 6 - Shift+Click 9 times again
Loop, 9 {
   
    SendInput, {Shift down}
    Click, 1588, 300
    SendInput, {Shift up}
    Sleep, 2000
}

; Step 7

SendInput, {Esc}
Sleep, 200

; Step 8

SendInput, {w down}
Sleep, 4000
SendInput, {w up}

; Step 9

SendInput, e
Sleep, 200

; Step 10

Click, 506, 602
Sleep, 200

; Step 11

Click, right, 601, 702
Sleep, 200

; Step 12

Click, 701, 825
Sleep, 200

; Extra cart and menu actions

Click, 551, 608
Sleep, 200


Click, right, 601, 702
Sleep, 200


Click, 701, 825
Sleep, 200


SendInput, {Esc}
Sleep, 200

; Step 13 - Hold S

SendInput, {s down}
Sleep, 5000
SendInput, {s up}
Sleep, 500

; Schedule next loop
if (running)
    SetTimer, FoxholeLoop, 10
return
