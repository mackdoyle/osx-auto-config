-- Oliver Taylor (@olivertaylor, http://olivertaylor.net) - June 2012

tell application "BBEdit"
	-- by @ollicle
	find "^|(?<!\\w[^\\w\\s])\\b(?=\\w)" searching in text of front text window options {search mode:grep, wrap around:false, backwards:true} with selecting match
end tell


