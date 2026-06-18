#Requires AutoHotkey v2.0

MyKeys := ["Caps + A", "Caps + B", "Caps + C", "Caps + E", "Caps + F", "Caps + G", "Caps + H", "Caps + L", "Caps + M", "Caps + N", "Caps + O"]

KeyDescription := [ "Run Fusion 360", "Brackets", "Curly Brackets", "Square Brackets", "Run Firefox", "Run Github Desktop", "Open my.h-da", "Run Matlab", "Open Moodle",
                    "Run Multisim", "Run Onenote"]


MyGui := Gui("+Resize", "List of Hotkeys",)
TabList := MyGui.AddTab(, ["General", "Matlab", "LaTeX"])
TabList.UseTab(1)
GeneralKeyList := MyGui.AddListView("r" . MyKeys.Length, ["Keys", "Description"])
loop MyKeys.Length
    GeneralKeyList.Add(, MyKeys[A_Index], KeyDescription[A_Index])
GeneralKeyList.ModifyCol()


RunGui() {
    MyGui.Show("Hide")
    MouseGetPos(&MouseX, &MouseY)
    Loop MonitorGetCount() {
        MonitorGetWorkArea(A_Index, &Left, &Top, &Right, &Bottom)
        if (MouseX >= Left && MouseX <= Right && MouseY >= Top && MouseY <= Bottom) {
            MyGui.GetPos(,, &GuiWidth)
            
            TargetX := Right - GuiWidth - 10
            TargetY := Top + 10
            
            MyGui.Show("x" . TargetX . " y" . TargetY)
            break
        }
}
}