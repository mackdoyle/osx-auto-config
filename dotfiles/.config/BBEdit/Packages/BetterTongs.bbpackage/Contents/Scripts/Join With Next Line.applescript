-- Oliver Taylor (@olivertaylor, http://olivertaylor.net) - 2013-01-27

tell application "BBEdit"
	
	-- Look at the previous character
	set prevChar to find "[\\S\\s]" searching in text of front text window options {search mode:grep, wrap around:false, backwards:true}
	
	-- select the whitespace and newlines after the insertion point
	find "\\s+" searching in text of front text window options {search mode:grep} with selecting match
	
	if found text of prevChar is in {" ", return} then
		
		set selection of front text window to grep substitution of ""
		select insertion point before selection
	else
		
		set selection of front text window to grep substitution of " "
		select insertion point after selection
	end if
end tell