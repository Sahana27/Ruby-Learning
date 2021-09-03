def mtdarray
	10.times do |num|
	square =num*num
	return num, square if num > 5
	end
end

num, square=mtdarray
puts num
puts square
