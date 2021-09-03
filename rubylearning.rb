#Define a constant
PI=3.142

=begin
	First RUby Program	
	puts : put string
	s means string
	automatically goes to the next line
=end
def p001hello 
 puts 'Hello'
end

=begin
Integers : without decimal
Floating-point numbers : decimal with point
underscore(_) :thousand separator
Operators
+ Addition
- Subtraction
* Multiplication
/ division	
=end
def p002rubynumbers
	puts 1 + 2
	puts 2 *3
	puts 3 / 2
	puts 10 - 11
	puts 1.5 / 2.6
end

=begin
	% differs from C and Java.
	Sign of modulus is same as the sign of second operand
=end
def modulus
	puts (5%3)
	puts ( -5 % 3)
	puts (5 % 3)
	puts (-5 % -3)

end

def oroperator
	puts nil || 2008
	puts false || 2008
	puts "ruby" || 2008
end
=begin
	
=end
def var_assign_using_or
	@variable= "Hello"
	@variable = @variable || "default value" 
	puts "#{@variable}"
end

=begin
	String : sequence of character
	Character between single or double quotes
	Strings are mutable : state can change
	back-tick(`) : command is sent to the OS as a command to executed, is puts is used to display
	system : To spawn separate process  is to use Kernel methond system.
			 Executes command in subprocess. 
			 returns true : commands found and executed successfully
			 false : commands exits wth non zero exit status
=end
def p003rubystrings
	puts "Hello World"
	
	# CAn use " or '. But, ' is more effective
	puts 'Hello WOrld'

	#String concatenate
	puts "I like" + " Ruby"

	#Escape Sequence
	puts 'It\'s my Ruby'

	#New here displays the string 3 times
	puts 'Hello' * 3

	puts PI

	#USe of back-tick
	puts "LIsting of files"
	puts `ls`

	system ("ls")

end

=begin
	bareword : combination of letters, number and underscore
	bare word can be used for method also
	When a bareword is encountered by ruby , it does one of the three things:
		1. equal sign on right : a variable undergoing an assignment
		2.  bareword could be a keyword
		3. might be a method call	

	COnversions
		1. to_i : to integer
		2. to_f : to float
		3. to_s : to string

	<< :appends to a string

=end
def p004stringusage

puts PI

# Defining a local variabe
my_string = 'I love my city, Pune'
puts my_string

var1 = 5
var2 = '2'

puts var1 + var2.to_i

a='hello'
a << 'world'
puts a

end

puts "Start Execution"

puts "01. HELLO PROGRAM"
p001hello

puts "02. RUBY NUMBERS"
p002rubynumbers

puts "Modulus example"
modulus

puts "difference between or and ||"
oroperator

puts "Variable assignment using or operator"
var_assign_using_or

puts "03. RUBY STRINGS "
p003rubystrings

puts "04. STRING USAGE"
p004stringusage


puts "End Execution"