#Requires AutoHotkey v2.0

GeneralKeys := [ "Caps + A", "Caps + B", "Caps + C", "Caps + E", "Caps + F", "Caps + G", "Caps + H", "Caps + L", "Caps + M", "Caps + N", "Caps + O", "Caps + S", "Caps + Ctrl + S",
            "Caps + T", "Caps + U", "Caps + V", "Caps + Left", "Caps + Right", "Caps + Num1", "Caps + Num2", "Caps + Num3", "Caps + Esc"]

GeneralKeyDescription := [ "Run Fusion 360", "Brackets", "Curly Brackets", "Square Brackets", "Run Firefox", "Run Github Desktop", "Open my.h-da", "Run Matlab", "Open Moodle",
                    "Run Multisim", "Run Onenote", "Backslash", "Gitcommit", "Run TeXstudio", "Signature", "Run VS-Code", "Move Window One Screen Left", "Move Window One Screen Right",
                    "Discord Stream Screen 1", "Discord Stream Screen 2", "Discord Stream Screen 3", "Reload Script"]

MatlabKeys := ["Caps + F"]

MatlabKeyDescription := ["SubPlot"]

MyGui := Gui("", "List of Hotkeys",)
TabList := MyGui.AddTab3("w320 Buttons", ["General", "Matlab", "LaTeX"])
TabList.UseTab(1)
GeneralKeyList := MyGui.AddListView("w300 r" . GeneralKeys.Length, ["Keys", "Description"])
loop GeneralKeys.Length
    GeneralKeyList.Add(, GeneralKeys[A_Index], GeneralKeyDescription[A_Index])
GeneralKeyList.ModifyCol(1, "Auto")
GeneralKeyList.ModifyCol(2, "Auto")
TabList.UseTab(2)
MatlabKeyList := MyGui.AddListView("w300 r" . GeneralKeys.Length, ["Keys", "Description"])
loop MatlabKeys.Length
    MatlabKeyList.Add(, MatlabKeys[A_Index], MatlabKeyDescription[A_Index])
MatlabKeyList.ModifyCol(1, "Auto")
MatlabKeyList.ModifyCol(2, "Auto")


RunGui() {
    MyGui.Show("Hide")
    CoordMode("Mouse", "Screen")
    MouseGetPos(&MouseX)
    
    loop MonitorGetCount() {
        MonitorGetWorkArea(A_Index, &Left, &Top, &Right, &Bottom)
        if(MouseX >= Left && MouseX <= Right) {
            Screen := A_Index
            break
        }
    }

    MyGui.GetPos(,, &GuiWidth)
            
    TargetX := Right - GuiWidth - 10
    TargetY := Top + 10
            
    MyGui.Show("x" . TargetX . " y" . TargetY)
}