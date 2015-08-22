(*JSHint for BBEdit
   Original by James Sinclair 2012 (http://forrst.com/posts/JSLint_Script_for_BBEdit-UQV)
   Modified by Markus Haverinen 2013 to work with JSHint
   Inspired by PHP Lint script by isao https://github.com/isao/shell/blob/42ecd2b760b63b841ea4176767b700b2863fe982/bbedit/Scripts/php-lint.applescript
*)

property jshintref : "/usr/bin/env PATH=/usr/local/bin jshint "

(* My version of jshint reports errors something like:
 someFile.js: line 14, col 39, Missing space after ';'.
*)

-- Function to get the line number
on jshintErrLine(lint_row)
  set line_marker to ": line "
	set pos_marker to ", col"
	set offst1 to (offset of line_marker in lint_row) + (length of line_marker)
	set offst2 to (offset of pos_marker in lint_row) - 1
	get text offst1 thru offst2 of lint_row
	return result as integer
end jshintErrLine

-- Split up errors
on jshintSplitLines(lint_msg)
	set lint_lines to paragraphs 3 thru -1 of lint_msg
	set out_rows to {}
	set lint_row to 0
	repeat with lint_line in lint_lines
		set line_number_pos to offset of "js:" in lint_line
		set lint_row to lint_row + 1
		if ((line_number_pos ≠ 0)) then
			copy (lint_row & " " & lint_line) to end of out_rows
		end if
	end repeat
	return out_rows
end jshintSplitLines

-- Save the document first
tell application "TextWrangler"
	tell first text document
		if modified then save
	end tell
	get file of first text document
	set bbfref to result
end tell

-- Run the shell script
try
	do shell script jshintref & POSIX path of bbfref
	display dialog "Ok: " & result buttons {"finished checking"} default button 1
on error lint_msg
	set lint_rows to jshintSplitLines(lint_msg)
	tell application "TextWrangler"
		set result_rows to {}
		repeat with lint_row in lint_rows
			set lint_row to item 3 of lint_row
			set linenum to my jshintErrLine(lint_row)
			tell text window 1
				set off to (characterOffset of line linenum) - 1
				set len to (length of line linenum)
			end tell
			copy {result_kind:error_kind, result_file:bbfref, start_offset:off, end_offset:(off + len), result_line:linenum, message:lint_row} to end of result_rows
		end repeat
		make new results browser with data result_rows with properties {name:"bb jshint"}
	end tell
end try
