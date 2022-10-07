GuiSize:
	if !initSize {
		GuiControlGet, c1, Pos, codestring
		GuiControlGet, c2, Pos, Button1
		GuiControlGet, c3, Pos, Button2
		GuiControlGet, c4, Pos, Button3
		GuiControlGet, c5, Pos, Button4
		GuiControlGet, c6, Pos, Picture1
		GuiControlGet, c7, Pos, commandlookup
		GuiControlGet, c8, Pos, Search
		GuiControlGet, c9, Pos, GroupBox1
		GuiControlGet, c10, Pos, synhelp
		GuiControlGet, c11, Pos, numlines
		GuiControlGet, c12, Pos, Button5
		
		initSize := { "gui"    : {w:A_GuiWidth, h:A_GuiHeight}
		            , "Edit1"  : {x:c1X, y:c1Y, w:c1W, h:c1H}
		            , "Button1": {x:c2X, y:c2Y, w:c2W, h:c2H}
		            , "Button2": {x:c3X, y:c3Y, w:c3W, h:c3H}
					, "Button3": {x:c4X, y:c4Y, w:c4W, h:c4H}
					, "Button4": {x:c5X, y:c5Y, w:c5W, h:c5H}
					, "picture1": {x:c6X, y:c6Y, w:c6W, h:c6H}
					, "listbox1": {x:c7X, y:c7Y, w:c7W, h:c7H}
					, "Edit2"	: {x:c8X, y:c8Y, w:c8W, h:c8H}
					, "GroupBox1"	: {x:c9X, y:c9Y, w:c9W, h:c9H}
					, "synhelp"	: {x:c10X, y:c10Y, w:c10W, h:c10H}
					, "Edit3"	: {x:c11X, y:c11Y, w:c11W, h:c11H}
					, "Button5"	: {x:c12X, y:c12Y, w:c12W, h:c12H}}
					
		lastGuiW := A_GuiWidth
		lastGuiH := A_GuiHeight
		return
	}

	if (A_EventInfo = 1)  ; The window has been minimized.
	|| (A_GuiWidth = lastGuiW && A_GuiHeight = lastGuiH) { ; The window has been restored (from minimized state)
		return
	}

	changedW := A_GuiWidth  - initSize.gui.w
	changedH := A_GuiHeight - initSize.gui.h

	GuiControl, Move, codestring, % ("w" initSize.Edit1.w + changedW) . (" h" initSize.Edit1.h   + changedH)
	GuiControl, Move, Button1  , % ("x" initSize.Button1.x + changedW) . ("y" initSize.Button1.y + changedH)
	GuiControl, Move, Button2  , % ("x" initSize.Button2.x + changedW) . ("y" initSize.Button2.y + changedH)
	GuiControl, Move, Button3  , % ("x" initSize.Button3.x + changedW) . ("y" initSize.Button3.y + changedH)
	GuiControl, Move, Button4  , % ("x" initSize.Button4.x + changedW) . ("y" initSize.Button4.y + changedH)
	GuiControl, Move, picture1  , % ("x" initSize.picture1.x + changedW) . ("y" initSize.picture1.y + changedH)
	GuiControl, Move, commandlookup  , % (" h" initSize.listbox1.h   + changedH) . ("x" initSize.listbox1.x + changedW)
	GuiControl, Move, Search  , % ("x" initSize.edit2.x + changedW)
	GuiControl, Move, GroupBox1  , % ("y" initSize.GroupBox1.y + changedH) . ("w" initSize.GroupBox1.w + changedW)	
	GuiControl, Move, synhelp  , % ("y" initSize.synhelp.y + changedH) . ("w" initSize.synhelp.w + changedW)
	GuiControl, Move, numlines, %  (" h" initSize.Edit3.h   + changedH)
	GuiControl, Move, Button5  , % ("y" initSize.Button5.y + changedH)
	
	lastGuiW := A_GuiWidth
	lastGuiH := A_GuiHeight

Return

saveguisize:
IfWinActive AHK Playground %vmode%
	{
	gui, submit, nohide
	WinGetPos,x,y,w,h,a
	IniWrite, %x%, %inihome%, sizenpos, x
	IniWrite, %y%, %inihome%, sizenpos, y
	IniWrite, %w%, %inihome%, sizenpos, w
	IniWrite, %h%, %inihome%, sizenpos, h
	}
Return
