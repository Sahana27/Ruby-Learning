=begin
	Ruby code blocks are chunks of code between braces or
	between do- end that you can associate with method invocations
=end

def call_block
	puts 'Start of method'
	yield
	yield
	puts 'End of method'
end

call_block {puts 'In the block' }
