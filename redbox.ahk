; Press F3 to show the OCR region as a red box
F3::
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

; ==== CONFIGURE YOUR REGION HERE ====
x := 1206
y := 1025
w := 150
h := 30
; ====================================

Gui, +AlwaysOnTop -Caption +ToolWindow
Gui, Color, Red
Gui, Show, x%x% y%y% w%w% h%h% NoActivate
Sleep, 1000  ; Show for 1 second
Gui, Destroy
return
