s1='Sachin'
s2='Sachin'
s3 = s1

if s1 == s2
	puts "Both Strings have identical content"
else
	puts "Both Strings do not have identical content"
end

if s1.eql?(s2)
	puts 'Both Strings have identical content'
else
	puts 'Both Strings do not have identical content'
end

if s1.equal?(s2)
	puts 'Both object are identical'
else
	puts 'Both objects are not identical'
end
