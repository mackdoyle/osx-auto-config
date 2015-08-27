#!/usr/bin/ruby
print ARGF.read.gsub(/(\n[ \t]+)(?=[^\n]|\Z)/, " ")