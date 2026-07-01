#Requires AutoHotkey v2.0

subplot() {
    var_n := InputBox("Anzahl der Plots:").Value

    WinActivate(".m")

    loop var_n {
        xlabel := InputBox("Bezeichnung der X-Achse").Value
        ylabel := InputBox("Bezeichnung der Y-Achse").Value
        title := InputBox("Titel des Plots").Value
        Send "subplot(" var_n ", 1, " A_Index ")"
        Send "{Enter}"
        Send "hold on{Enter}"
        Send "grid on{Enter}"
        Send "fplot(){Enter}"
        Send 'xlabel("' xlabel '"){Enter}'
        Send 'ylabel("' ylabel '"){Enter}'
        Send 'title("' title '"){Enter}'
        Send 'hold off'
    }
}