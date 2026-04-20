#Requires AutoHotkey v2.0

; Auth Keys:
; HL 141: yZX0LKiQmGxVyRzY3zVNCfz7XN5X2wXn
; VR 143: 23ojVaukKmdOdWsDltg72XJvPZwsGDPJ
; HR 144: mjZsT4pi2rD8S3FQaRcCWarY71QKanBA
; VL 145: rr70nXyYlQk0xv6q8xSHpFvnlXr5MHDa

url := ["http://192.168.178.143:16021/api/v1/23ojVaukKmdOdWsDltg72XJvPZwsGDPJ/state", 
        "http://192.168.178.145:16021/api/v1/rr70nXyYlQk0xv6q8xSHpFvnlXr5MHDa/state",
        "http://192.168.178.144:16021/api/v1/mjZsT4pi2rD8S3FQaRcCWarY71QKanBA/state",
        "http://192.168.178.141:16021/api/v1/yZX0LKiQmGxVyRzY3zVNCfz7XN5X2wXn/state"
        ]

http := ComObject("WinHttp.WinHttpRequest.5.1")

; JSON Code als Variablen
on := '{"on":{"value":true}}'

; HTTP Funktionen
HttpRequest(method, url, body := "", token := "") {
    http.Open(method, url, false)

    ; Header setzen
    http.SetRequestHeader("Content-Type", "application/json")

    if (token != "")
        http.SetRequestHeader("Authorization", "Bearer " token)

    http.Send(body)

    return http.ResponseText
}


; Funktionen zur Lichtsteuerung
allOn() {
    loop 4 {
        HttpRequest("PUT", url[A_Index], on)
    }
}

dimmUp() {

    response := HttpRequest("GET", url[1])

    match := RegExMatch(response, '"brightness":\{"value":(\d+)', &m)

    brightness := m[1]

    if (brightness = 100) {
        return
    }

    brightness := brightness +10

    if (brightness > 100) {
        brightness := 100
    }

    dimm := '{"brightness":{"value":' brightness '}}'

    loop 4 {
        HttpRequest("PUT", url[A_Index], dimm)
    }

}

dimmDown() {

    response := HttpRequest("GET", url[1])

    match := RegExMatch(response, '"brightness":\{"value":(\d+)', &m)

    brightness := m[1]
    
    if (brightness = 0) {
        return
    }

    brightness := brightness -10

    if (brightness < 10) {
        brightness := 10
    }

    dimm := '{"brightness":{"value":' brightness '}}'

    loop 4 {
        HttpRequest("PUT", url[A_Index], dimm)
    }
}

getHSB() {
    response := HttpRequest("PUT", url[1])
    hue := RegExMatch(Hue, '"hue":\{"value":(\d+)', &m)

    response := HttpRequest("GET", url[1])
    saturation := RegExMatch(response, '"sat":\{"value":(\d+)', &m)

    response := HttpRequest("GET", url[1])
    brightness := RegExMatch(response, '"brightness":\{"value":(\d+)', &m)

    return [hue, saturation, brightness]
}

changeRed(velocity) {

    while(velocity > 20) {
        
    }
}

ChangeColor(midiEvent) {
    velocity := midiEvent.Velocity

    HSB := getHSB()

    hue := HSB[1]
    saturation := HSB[2]
    brightness := HSB[3]

    red := HSBtoRGB(hue, saturation, brightness)

    while velocity > 20
        velocity := GetKeyVelocity(midiEvent)
        if (midiEvent.Note = 46)
            red := red + 1
        else if (midiEvent.Note = 47)
            green := green + 1
        else if (midiEvent.Note = 48)
            blue := blue + 1
        sleep 100

}
