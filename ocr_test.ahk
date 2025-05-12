F2::  ; Press F2 to scan first region and look for SalvageMine
RunOCRRegion(inventoryCoords())
return

F3::  ; Press F3 to scan another region and look for SalvageMine
RunOCRRegion(buildCoords())
return

F5:: 
RunOCRRegion(checkbuild())
return

; --------- Functions ---------

inventoryCoords() {
    return { x: 1206, y: 1025, w: 150, h: 30 }
}

buildCoords() {
    return { x: 1280, y: 768, w: 290, h: 100 }  ; Example second region
}
checkbuild() {
    return { x:453, y:207, w:600, h:150 }
    
}
RunOCRRegion(coords) {
    x := coords.x
    y := coords.y
    w := coords.w
    h := coords.h

    ; Run the Python OCR script to capture text from the defined region
    RunWait, %ComSpec% /c python ocr_reader.py %x% %y% %w% %h% > result.txt, , Hide
    FileRead, textOut, result.txt
    MsgBox, % "OCR result:`n[" textOut "]"

   
    if (InStr(textOut, "SalvageMine")) {
        
        MsgBox, SalvageMine found, now clicking!
        
        ; Example logic to calculate where to click based on the coordinates of the OCR region
        ; Adjust xOffset and yOffset based on where the text is within the region
        xOffset := 50  ; Example offset, tweak this based on actual OCR output
        yOffset := 20  ; Example offset, tweak this based on actual OCR output
        
        clickX := x + xOffset
        clickY := y + yOffset
        
        ; Click the calculated position
        MouseClick, left, clickX, clickY
    }
    else {
        MsgBox, "SalvageMine" not found!
    }

    ; Show a GUI box briefly as feedback
    Gui, +AlwaysOnTop -Caption +ToolWindow
    Gui, Color, Red
    Gui, Show, x%x% y%y% w%w% h%h% NoActivate
    Sleep, 1000  ; Show for 1 second
    Gui, Destroy
}
