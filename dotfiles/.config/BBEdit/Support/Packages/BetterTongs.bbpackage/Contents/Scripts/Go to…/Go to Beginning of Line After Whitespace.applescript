-- Oliver Taylor (@olivertaylor, http://olivertaylor.net) - June 2012

set theSearch to "^([ \\t]+)?([\\d\\w]+[\\.:] )( +)?([-:] )?|^([ \\t]+)?\\#+[ ]+|^([ \\t]+)?[\\*\\-\\+\\¥\\>] |^[ \\t]+|^"

tell application "BBEdit"
	tell the selection to set _column to startColumn
	if _column > 1 then
		find theSearch searching in text of front text window options {search mode:grep, backwards:true} with selecting match
	else
		find theSearch searching in text of front text window options {search mode:grep} with selecting match
	end if
	tell the selection to set _length to the length of selection
	if _length > 0 then
		select insertion point after selection
	end if
end tell
