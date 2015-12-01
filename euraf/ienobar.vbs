Dim objIE
Set objIE = WScript.CreateObject ("InternetExplorer.Application")
objIE.Toolbar = false
objIE.AddressBar = false
objIE.MenuBar = false
objIE.Navigate "http://localhost:3000"
objIE.Visible = true

