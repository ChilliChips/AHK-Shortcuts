#Requires AutoHotkey v2.0

#Include Lib/MIDIv2.ahk         ; MIDI to AHK Library

#Include Functions\Matlab.ahk
#Include Functions\Paths.ahk
#Include Functions\Functions.ahk
#Include Functions\Midi.ahk
#Include Functions\Nanoleaf.ahk
#Include Functions\Gui.ahk
;#Include Functions\LaTeX.ahk

; MIDI Setup
MIDI := MIDIv2()
midiSetup()

SetCapsLockState "AlwaysOff"    ; disables CapsLock
SetTitleMatchMode 2             ; window title can contain certain string inside title



#HotIf GetKeyState("CapsLock", "P") && WinActive(".m")
    F:: {
        subplot()
    }


#HotIf GetKeyState("CapsLock", "P")
    A:: {
        if !WinExist("ahk_exe Fusion360.exe")
            Run(fusion)                     ; Dateipfad festgelegt in Lib/Paths
        if WinExist("ahk_exe Fusion360.exe")
            WinActivate
    }

    B:: {                       ; writes Brackets
        Send "()"
        Send "{Left}"
    }

    C:: {                       ; writes curly brackets
        Send "{{}"
        Send "{}}"
        Send "{Left}"
    }

    E:: {                       ; writes square brackets
        Send "[]"
        Send "{Left}"
    }

    F:: {
        if !WinExist("ahk_exe firefox.exe")
            Run(firefox)                    ; Dateipfad festgelegt in Lib/Paths
        else if WinExist("ahk_exe firefox.exe")
                WinActivate
    }

    G:: {                       ; Run GitHub Desktop
        if !WinExist("ahk_exe GitHubDesktop.exe")
            Run(github)
        if WinExist("ahk_exe GitHubDesktop.exe")
            WinActivate
    }

    H:: {                       ; Opens My.H-da Website
        Run "https://my.h-da.de"
    }

    L:: {                       ; Run MATLAB
        if !WinExist("ahk_exe MATLAB.exe")
            Run(matlab)                     ; Dateipfad festgelegt in Lib/Paths
        if WinExist("ahk_exe MATLAB.exe")
                WinActivate
    }

    M:: {                       ; opens moodle
        Run "https://lernen.h-da.de/"
    }

    N:: {
        if !WinExist("ahk_exe multisim.exe")
            Run(multisim)                     ; Dateipfad festgelegt in Lib/Paths
        if WinExist("ahk_exe multisim.exe")
                WinActivate
    }

    O:: {
        if !WinExist("ahk_exe onenote.exe")
            Run(onenote)
        if WinExist("ahk_exe onenote.exe")
            WinActivate
    }

    S:: {                       ; writes backslash
        Send "\"
    }

    ^S:: {
        gitcommit()
    }

    T:: {                       ; Run TeXstudio
        if !WinExist("ahk_exe texstudio.exe")
            Run(texstudio)                  ; Dateipfad festgelegt in Lib/Paths
        if WinExist("ahk_exe texstudio.exe")
            WinActivate
    }

    U:: {
        signature()                         ; E-Mail Signatur, festgelegt in Lib/Paths
    }

    V:: {                       ; Run Visual Studio Code
        if !WinExist("ahk_exe Code.exe")
            Run(vscode)                     ; Dateipfad festgelegt in Lib/Paths
        if WinExist("ahk_exe Code.exe")
            WinActivate
    }

    Left:: {
        send "#+{Left}"
    }

    Right:: {
        send "#+{Right}"
    }

    Numpad1:: {
        screen := 1
        discordStream(screen)
    }

    Numpad2:: {
        screen := 2
        discordStream(screen)
    }

    Numpad3:: {
        screen := 3
        discordStream(screen)
    }

    Esc:: {
        Reload
    }

    AppsKey:: {
        RunGui()          ; Opens GUI with Hotkey Descriptions
    }

    +AppsKey:: {
        MyGui.Hide()
    }

#HotIf 
    
; Launchpad Keys

MidiInNoteOn(midiEvent){
    note := midiEvent.NoteNumber
    velocity := midiEvent.Velocity
    OnKeyPress(note)
}

MidiInNoteOn11(midiEvent) {             ; Youtube
    run "https://www.youtube.com/"
}

MidiInNoteOn12(midiEvent) {             ; Twitch
    run "https://www.twitch.tv/"
}

MidiInNoteOn13(midiEvent) {             ; Spotify
    run "https://open.spotify.com"
}

MidiInNoteOn14(midiEvent) {
    SoundSetMute(-1, , "Eingang (Realtek(R) Audio)")
}

MidiInNoteOn18(midiEvent) {             ; Launchpad Lights off
    PadOff()
}

MidiInNoteOn21(midiEvent) {             ; Disney+
    run "https://www.disneyplus.com"
}

MidiInNoteOn22(midiEvent) {             ; Prime
    run "https://www.amazon.de/gp/video/storefront"
}

MidiInNoteOn23(midiEvent) {             ; Netflix
    run "https://www.netflix.com"
}

MidiInNoteOn28(midiEvent) {             ; Deckenlicht an
    allOn()
}

MidiInNoteOn31(midiEvent) {             ; Moodle
    run "https://lernen.h-da.de"
}

MidiInNoteOn32(midiEvent) {             ; H-Da Mail
    run "https://webmail.stud.h-da.de/stud/index.php"
}

MidiInNoteOn33(midiEvent) {             ; My Hda
    run "https://my.h-da.de"
}

MidiInNoteOn37(midiEvent) {
    dimmDown()
}

MidiInNoteOn38(midiEvent) {
    dimmUp()
}