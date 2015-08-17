-- Oliver Taylor (@olivertaylor, http://olivertaylor.net) - May 2013

--Display Dialog and Get Input
display dialog "Backward Grep Search for..." default answer ""

--Get Answer & Return Comment
set theSearch to (text returned of result)

tell application "BBEdit"
	try
		find theSearch searching in text of front text window options {search mode:grep, starting at top:false, wrap around:false, backwards:true, case sensitive:false, match words:false, extend selection:false} with selecting match
	end try
end tell