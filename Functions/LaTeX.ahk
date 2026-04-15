#Requires AutoHotkey v2.0

greek := Map(
    "a", "alpha",
    "b", "beta",
    "g", "gamma",
    "d", "delta",
    "e", "epsilon",
    "z", "zeta",
    "h", "eta",
    "q", "theta",
    "i", "iota",
    "k", "kappa",
    "l", "lambda",
    "m", "mu",
    "n", "nu",
    "c", "xi",
    "o", "omicron",
    "p", "pi",
    "r", "rho",
    "s", "sigma",
    "t", "tau",
    "u", "upsilon",
    "f", "phi",
    "x", "chi",
    "y", "psi",
    "w", "omega"
)


HotIf(() => GetKeyState("CapsLock", "P") && WinActive("ahk_exe texstudio.exe"))
    for key, name in greek {
        ; Kleinbuchstaben
        Hotkey(key, (*) => SendText("\" name))

        ; Großbuchstaben (Shift)
        Hotkey("+" key, (*) => SendText("\" StrUpper(name)))
    }
HotIf()