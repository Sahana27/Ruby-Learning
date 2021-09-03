#!/usr/bin/ruby

$LOAD_PATH.unshift("/usr/local/rvm/gems/ruby-1.9.3-p547/gems/ruby-mysql-2.9.12/lib")

require 'mysql'
require 'cgi'

cgi = CGI.new
puts cgi.header

#create connection to Mysql
def create_connection()
	con = Mysql.new 'localhost', 'cloudera','', 'chartsearch' #opening a connection with Mysql
	return con	
end

#Drop table if table exist
def drop_table(con)
	 con.query("DROP TABLE IF EXISTS \ Reports")
end

#create table 
def create_table(con)
	 con.query("CREATE TABLE IF NOT EXISTS \ Reports(CLIENT_NAME varchar(50), RAW int, RAW_INPROCESS int, RAW_COMPLETED int, PROCESSED int, PROCESSED_UPLOADING int, PROCESSED_COMPLETED int)")
end

#inserts values to the table
def insert_values(con,fields)
	con.query("INSERT INTO Reports(CLIENT_NAME, RAW, RAW_INPROCESS, RAW_COMPLETED, PROCESSED, PROCESSED_UPLOADING, PROCESSED_COMPLETED) VALUES('#{fields[0]}', '#{fields[1]}', '#{fields[2]}', '#{fields[3]}', '#{fields[4]}', '#{fields[5]}', '#{fields[6]}')")
end

#close the connection
def close_conn(con)
	 con.close 	
end

#Retrieves client name
def get_clientname(con)
	con.query("select CLIENT_NAME from Reports")
end

begin
        con=create_connection()
	drop_table(con)
	create_table(con)	
value = cgi['year']
	puts "<html>"
	puts "<head>"
	puts "<div style=\"width: 100%; font-size: 20px; font-weight: italic; text-align: center;\">\n"
	puts "<center> <b><h2>DATA PROCESSING ANALYSIS OF CHARTSHEET</b> </center>"
	puts "</head>"
	puts "<body>"
	if(value == '2013')
		csv = File.open("report1.csv","r")
	else
		csv = File.open("report2.csv","r")
	end
	#Read from csv file and store into table
	flag = true
	if(csv)		#if the file exists
        csv.each_line do |line|
                        fields = line.split(',')
                        if flag == true
                        flag = false
                        next
			end
	insert_values(con,fields)
        end
	end

	con=create_connection()
	rs =get_clientname(con)
	puts "<form method='get' action=\'analysis.rb?clients=value\'>"
	puts "<b>Client Name</b>"
	puts "<select name=\"clients\">"
	#adds to the dropdownbox
		rs.each do |x|
			puts "<option value=#{x}>#{x}</option>" #adding the client names to the dropdown
		end
	puts "</select>"
	puts "<input type=\"submit\" value=\"Display the Analysis\"/>"
	puts "</form>"
	puts "<div align=\"right\"><a href=\"page_one.rb\">Go Back,To Select another Year</a></div>"
	puts "</div>"
	puts "</body>"
	puts "</html>"

rescue Mysql::Error => e	#To handle MySQL exceptions
    puts e.errno
    puts e.error

ensure
        close_conn(con) if con	#close the Mysql connection
end

