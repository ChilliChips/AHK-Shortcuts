#Requires AutoHotkey v2.0

; Github Desktop commit

gitcommit() {
    if(!WinExist("Github Desktop")) {
        return
    }

    title := WinGetTitle("A")

    summary := InputBox("Zusammenfassung der Änderungen").Value

    coordX := 160

    coordY_Summary := 475           ; Coords of Summary Textbox
    coordY_Commit := 630            ; Coords of Commit Button

    WinActivate("GitHub Desktop")

    BlockInput("MouseMove")
    MouseGetPos(&mouseX, &mouseY)

    MouseClick("left", coordX, coordY_Summary, , 0)
    Send(summary)

    MouseClick("left", coordX, coordY_Commit, , 0)

    ; Reactivates previous Window and moves Mouse back
    WinActivate(title)
    MouseMove(mouseX, mouseY, 0)

    BlockInput("MouseMoveOff")

}


; Get Index of Array Element
getArrayValueIndex(arr, val) {
	Loop arr.Length {
		if (arr[A_Index] == val)
			return A_Index
	}
}


discordStream(screen){

    taskbar := [940, 190, 360, 660]
    notaskbar := [990, 210, 400, 700]

    WinActivate("ahk_exe Discord.exe")

    WinGetPos(&Xpos,,,&OutHeight, "A")

    if(OutHeight = 1056) {      ; checks, if window ist on screen with Taskbar
        ycoord := taskbar
    }
    else {
        ycoord := notaskbar
    }

    BlockInput("MouseMove")
    MouseGetPos(&mouseX, &mouseY)
    MouseMove(150, ycoord[1])
    send "{LButton}"                    ; opens streaming window
    Sleep 500

    MouseMove(960, ycoord[2])
    send "{LButton}"                    ; opens screen selection
    Sleep 500

    if(screen = 1) {
        MouseMove(730, ycoord[3])
        send "{LButton}"                    ; streams Screen 1
        MouseMove(mouseX, mouseY)
        BlockInput("MouseMoveOff")
        return
    }

    if(screen = 2) {
        MouseMove(1200, ycoord[3])
        send "{LButton}"                    ; streams Screen 2
        MouseMove(mouseX, mouseY)
        BlockInput("MouseMoveOff")
        return
    }

    if(screen = 3) {
        MouseMove(730, ycoord[4])
        send "{LButton}"                    ; streams Screen 3
        MouseMove(mouseX, mouseY)
        BlockInput("MouseMoveOff")
        return
    }
}