-- Oliver Taylor (@olivertaylor, http://olivertaylor.net) - June 2012

tell application "BBEdit"
	find "(?<=\\r^\\r)(?=[^\\r])|\\A" searching in text of front text window options {search mode:grep, starting at top:false, wrap around:false, backwards:true, case sensitive:false, match words:false, extend selection:false} with selecting match
end tell