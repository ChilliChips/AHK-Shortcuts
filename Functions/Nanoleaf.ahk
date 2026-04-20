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

getColor() {
    effect := HttpRequest("PUT", url[1])
    match := RegExMatch(effect, '"write":{"command":"request", "animName":"RGB"}', &m)      ; Scene RGB erstellen
}

changeRed(velocity) {

    while(velocity > 20) {
        
    }
}