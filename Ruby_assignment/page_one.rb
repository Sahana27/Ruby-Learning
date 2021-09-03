#!/usr/bin/ruby

require 'cgi'

cgi = CGI.new
puts cgi.header
puts "<html>"
puts "<head>"
puts "<div style=\"width: 100%; font-size: 20px; font-weight: italic; text-align: center;\">\n"
puts "<center> <b><h2>DATA PROCESSING ANALYSIS OF CHARTSHEET</b> </center>"
puts "</div>"
puts "</head>"
puts "<body>"
puts "<br>"
puts "<br>"
puts "<br>"
puts "<center>"
puts "<form method='get' action=\'page_two.rb?year=value\'>"
puts "<b>YEAR</b>"
puts "<select name=\"year\">"
puts "<option value=\"2013\">2013</option>"
puts "<option value=\"2014\">2014</option>"
puts "</select>"
puts "<input type=\"submit\" value=\"Select Client\"/>"
puts "</form>"
puts "</center>"
puts "</body>"
puts "</html>"
