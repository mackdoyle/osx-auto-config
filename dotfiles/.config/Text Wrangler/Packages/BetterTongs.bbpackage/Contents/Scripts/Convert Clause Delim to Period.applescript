try
	tell application "BBEdit"
		set delim to find "\\s*[\\.\\-,]\\s(\\w)" searching in text of front text window options {search mode:grep} with selecting match
		set selection to grep substitution of ". \\U\\1"
		select insertion point before selection
	end tell
on error
	beep
end try