-- Oliver Taylor (@olivertaylor, http://olivertaylor.net) - October 2012

tell application "BBEdit"
	-- by @ollicle
	find "(?<=\\w)\\b(?![^\\w\\s]\\w)|$" searching in text of front text window options {search mode:grep, wrap around:false} with selecting match
end tell
