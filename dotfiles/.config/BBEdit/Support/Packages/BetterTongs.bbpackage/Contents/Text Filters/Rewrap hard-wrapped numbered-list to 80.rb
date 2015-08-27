#!/usr/bin/ruby

a = ARGF.read

# Remove line-breaks within hard-wrapped list-items
a = a.gsub!(/(?<=\S)(\n)(?!\s*\d)/, ' ')

# Wrap to 77 Characters
a = a.gsub(/(.{1,77})( +|$)\n?|(.{77})/, "\1\3\n")

# Any line that doesn't begin with a number should be indented
a = a.gsub(/^(?!\d)/, "   ")

print a