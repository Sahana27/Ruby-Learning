var1=[]
puts var1[0]

var2=[5]
puts var2[0]

var3=['Hello','goodbye']
puts var3[0]
puts var3[1]

flavour= 'mango'
var4 = [80.5, flavour,[true,false]]
puts var4[2]

name=['satish','Talim','Ruby','Java',]
puts name[0]
puts name[2]
puts name[4]

location =['pune','Mumbai','bangalore']
location.each do |loc|
puts 'I Love ' + loc + '!'
puts "Dont you?"
end

location.delete('Mumbai')
location.each do |loc|
	puts 'I Love' + loc +'!'
	puts "Dont you?"
end

