#!/usr/bin/ruby

$LOAD_PATH.unshift("/usr/local/rvm/gems/ruby-1.9.3-p547/gems/ruby-mysql-2.9.12/lib")
$LOAD_PATH.unshift("/usr/local/rvm/gems/ruby-1.9.3-p547/gems/gruff-0.5.1/lib")

require 'gruff'
require 'mysql'
require 'cgi'

cgi = CGI.new
puts cgi.header
value  = cgi['clients']
value.gsub!("\"","")
value.gsub!("[","")
value.gsub!("]","")
puts "<html>"
puts "<head>"
puts "<div style=\"width: 100%; font-size: 20px; font-weight: italic; text-align: center;\">\n"
puts "<center> <b><h2>DATA PROCESSING ANALYSIS OF CHARTSHEET</b> </center>"
puts "</head>"
puts "<body>"
puts "<b><u>"
puts value
puts "</u></b>"
puts "<br>"
begin
        con = Mysql.new 'localhost', 'cloudera','', 'chartsearch'
        g = Gruff::Bar.new
        g.title = "Visual BAR Graph Test"
        result = con.query("SELECT * FROM Reports WHERE CLIENT_NAME = '#{value}'")
        result.each_hash do |h|
                h.each do |key, val|
				if(key=="RAW"||key=="RAW_INPROCESS"|| key == "RAW_COMPLETED" || key=="PROCESSED"||key=="PROCESSED_UPLOADING"||key == "PROCESSED_COMPLETED")
				 g.data("#{key}", Integer(val))
				 puts "<b>"
				 puts key, val
				 puts "</b><br>"
			end
                end
                g.write("graph_analysis.png")
		puts "<br>"
        end


rescue Mysql::Error => e
    puts e.errno
    puts e.error

ensure
        con.close if con
end

puts "<br>"
puts "<a href=\"graph_analysis.png\"><b>Show graph</b></a><br>"
puts "<div align=\"right\"><a align=\'right\' href=\"page_two.rb\">BACK</a></div>"
puts "</body>"
puts "</html>"


        

