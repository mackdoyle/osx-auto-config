#!/usr/bin/env ruby

require 'cgi'

print CGI.unescapeHTML( ARGF.read )
