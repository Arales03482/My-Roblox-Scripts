Gui,Show,w250 h150,EZSync

Gui,Font,s12
Gui,Add,Button,x80 y17 w90 h60 vActivate gDesyncBtn,Desync Roblox
Gui,Add,Text,x25 y100,Hold X while pressing Desync

DesyncBtn:
	GetKeyState,state,X,P
	if state=U
		return
	;otherwise:
	Sleep 1000
	Send,{PgUp}{Up Down}
	Sleep 50
	Send,{Up Up}
	Sleep 50
	Send,{PgDn}{Down Down}
	Sleep 50
	Send,{Down Up}
	Sleep 50
	Send,{Home}{Left Down}
	Sleep 50
	Send,{Left Up}
	Sleep 50
	Send,{End}{Right Down}
	Sleep 50
	Send,{Right Up}
	return

GuiClose:
	ExitApp
