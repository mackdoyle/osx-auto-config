tell application "BBEdit"
	try
		tell text of front text window
			set lineOfInsertionPoint to line
			set findReco to find "(?<=[\\.\\?\\!\\-] |$)" searching in lineOfInsertionPoint Â
				options {search mode:grep, starting at top:false, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false} with selecting match
		end tell
	on error errMsg number errNum
		set sep to "=============================="
		set e to sep & return & "Error: " & errMsg & return & sep & return Â
			& "Error Number: " & errNum & return & sep
		beep
		display dialog e
	end try
end tell

