F2::  ; Press F2 to trigger OCR scan
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

; Define the region (example: top-left 400x200 box)
x := 1206
y := 1025
w := 150
h := 30

; Call Python OCR script
RunWait, %ComSpec% /c python ocr_reader.py %x% %y% %w% %h% > result.txt, , Hide

; Read OCR result
FileRead, textOut, result.txt

MsgBox, % "OCR result:`n[" textOut "]"


; Optional: act on result
if (InStr(textOut, "wavanaunt"))
{
    MsgBox, Detected Low Stamina!
    ; Send, {space} ; or whatever
}


return

