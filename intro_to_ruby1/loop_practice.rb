names = ['Sheng', 'Kevin', 'Audrey', 'KJ', 'Delilah', 'Josh', 'Mack', 'Rey']

count = 0

while count < names.length do |variable|
	p names[count]
	count +=1
end

until count > names.length-1 do
	p names[count]
	count +=1
end

for item in names
	p item
end

p "The longest name is: " + names.max_by(&:length)
