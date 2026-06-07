#Requires AutoHotkey v2.0

#Include Functions.ahk

#Include ../Lib\MIDIv2.ahk
MIDI := MIDIv2()

Keys := [                                                   
    11, 12, 13, 14, 15, 16, 17, 18, 
    21, 22, 23, 24, 25, 26, 27, 28, 
    31, 32, 33, 34, 35, 36, 37, 38, 
    41, 42, 43, 44, 45, 46, 47, 48, 
    51, 52, 53, 54, 55, 56, 57, 58,
    61, 62, 63, 64, 65, 66, 67, 68, 
    71, 72, 73, 74, 75, 76, 77, 78, 
    81, 82, 83, 84, 85, 86, 87, 88
]

; Key Functions
; ["unbound",   "unbound",  "unbound",  "unbound",  "unbound",  "unbound",  "unbound",  "unbound",]
; ["unbound",   "unbound",  "unbound",  "unbound",  "unbound",  "unbound",  "unbound",  "unbound",]
; ["unbound",   "unbound",  "unbound",  "unbound",  "unbound",  "unbound",  "unbound",  "unbound",]
; ["unbound",   "unbound",  "unbound",  "unbound",  "unbound",  "unbound",  "unbound",  "unbound",]
; ["unbound",   "unbound",  "unbound",  "unbound",  "unbound",  "unbound",  "unbound",  "unbound",]
; ["Moodle",    "Hda Mail", "My.h-da",  "unbound",  "unbound",  "unbound",  "DimmDown", "DimmUp" ,]
; ["Disney+",   "Prime",    "Netflix",  "unbound",  "unbound",  "unbound",  "unbound",  "AllOn  ",]
; ["Youtube",   "Twitch",   "Spotify",  "unbound",  "unbound",  "unbound",  "unbound",  "PadOff"  ]


Colors :=  [                                                ; Custom Colors from Color Palette for 8x8 Key Matrix
    72, 49, 75, 11, 00, 00, 00, 00,
    41, 67,  6, 00, 00, 00, 00, 21,
     9, 112, 3, 00, 00, 00,  1,  3,
    00, 00, 00, 00, 00, 00, 00, 00,
    00, 00, 00, 00, 00, 00, 00, 00,
    00, 00, 00, 00, 00, 00, 00, 00,
    00, 00, 00, 00, 00, 00, 00, 00,
    00, 00, 00, 00, 00, 00, 00, 00
]


SysExSetup := "F0 00 20 29 02 0C 00 07 F7"         ; SysEx Message for Custom Mode 4


LightingSetup(){
    ; Initially lights up Launchpad on Startup
    loop {
        if (A_Index = 65)
            break
        if (A_Index < 65)
            MIDI.SendNoteOn(Keys[A_Index], Colors[A_Index], 1)
            continue
    }
}

OnKeyPress(note) {                          ; Animation to light up all Keys in Color of pressed Key
    if (note = 18 || note = 28)
        return
    value := getArrayValueIndex(Keys, note)
    loop {
        if (A_Index = 65)
            break
        if (A_Index < 65)
            MIDI.SendNoteOn(Keys[A_Index], Colors[value], 1)
            continue
        
    }
    
    Sleep(2000)

    LightingSetup()
}

Setup() {
    MIDI.SendSysEx(SysExSetup)

    LightingSetup()
}

GetKeyVelocity(midiEvent) {
    velocity := midiEvent.Velocity
    return velocity
}

PadOff() {                                  ; Turns of all Lighting
    loop {
        if (A_Index = 65)
            break
        if (A_Index < 65)
            MIDI.SendNoteOn(Keys[A_Index], 0, 1)
            continue
        
    }
}

AllRed() {                                  ; Turns of all Lighting
    loop {
        if (A_Index = 65)
            break
        if (A_Index < 65)
            MIDI.SendNoteOn(Keys[A_Index], 72, 1)
            continue
        
    }
}

