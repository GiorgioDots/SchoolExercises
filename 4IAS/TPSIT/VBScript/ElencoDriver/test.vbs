option explicit
dim fso,unita_di_massa,unita,dettaglio
Set fso = CreateObject("Scripting.FileSystemObject")
Set unita_di_massa = fso.drives
For Each unita In unita_di_massa
	if unita.IsReady then
		dettaglio = ""&unita.SerialNumber
		if dettaglio = "1920160989" then
			msgbox unita.DriveLetter
		end if
	end if
next

Set fso=nothing
