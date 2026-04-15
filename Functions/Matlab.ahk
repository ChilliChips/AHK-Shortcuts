#Requires AutoHotkey v2.0

subplot() {
    var_n := InputBox("Anzahl der Plots:").Value
    xlabel := InputBox("Bezeichnung der X-Achse").Value
    ylabel := InputBox("Bezeichnung der Y-Achse").Value

    count := 1

    WinActivate(".m")

    loop var_n {
        Send "subplot(" var_n ", 1, " count "){Enter}"
        Send "{Tab}hold on;{Enter}"
        Send "grid on;{Enter}"
        Send "fplot(){Enter}"
        Send 'xlabel("' xlabel '");{Enter}'
        Send 'xlabel("' ylabel '");{Enter}'
        Send "+{Tab}"
        count := count + 1
    }
}