-- Oliver Taylor (@olivertaylor, http://olivertaylor.net) - June 2012

tell application "BBEdit"
	find "^|(?<!\\w[^\\w\\s])\\b(?=\\w)" searching in text of front text window options {search mode:grep, wrap around:false, backwards:true, extend selection:true} with selecting match
	set selection of front text window to grep substitution of ""
end tell