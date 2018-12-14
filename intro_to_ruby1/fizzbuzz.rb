input = gets.chomp.to_i

if input % 3 == 0 and input % 5 == 0
	p 'FizzBuzz'
elsif input % 5 == 0
	p 'Buzz'
elsif input % 3==0
	p 'Fizz'
else
	print input
end