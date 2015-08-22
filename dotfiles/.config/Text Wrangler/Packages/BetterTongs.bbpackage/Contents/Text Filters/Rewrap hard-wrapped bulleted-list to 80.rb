#!/usr/bin/ruby

a = ARGF.read

# Remove line-breaks within hard-wrapped list-items
a = a.gsub(/(\n[ \t]+)(?=[^\n]|\Z)/, " ")

# Wrap to 77 Characters
a = a.gsub(/(.{1,78})( +|$)\n?|(.{78})/, "\\1\\3\n")

# Any line that doesn't begin with a number should be indented
a = a.gsub(/^(?![\*\-\+])/, "  ")

print a