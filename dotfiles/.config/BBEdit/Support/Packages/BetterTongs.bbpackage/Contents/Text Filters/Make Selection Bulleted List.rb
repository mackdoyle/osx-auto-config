#!/usr/bin/ruby
print ARGF.read.gsub(/^(\s*)(\d+\.? )?(\s*)([^\n\r]+)/, '\1* \3\4')
