tell application "BBEdit"
	tell window 1
		if selection as text is "" then
			set cursorPoint to characterOffset of selection
			find "^|(?<!\\w[^\\w\\s])\\b\\w" options {search mode:grep, backwards:true} with selecting match
			set selection to (grep substitution of "\\U&")
			select insertion point before character cursorPoint
		else
			change case selection making capitalize words with replacing target
		end if
	end tell
end tell
