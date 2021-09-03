puts "Hello, what's your name?"
STDOUT.flush
name=gets.chomp
puts 'Hello, '+name+'.'

if name == 'Sachin'
	puts 'Whhat a nice name !!'
elseif name == 'Sahana'
	puts 'Another nice name'
end

puts "Hello what's your name ??"
STDOUT.flush
name=gets.chomp
puts 'Hello' + name + '.'

if name == 'Sachin' || name =='Sahana'
	puts 'WHat a nice name!!'
end
