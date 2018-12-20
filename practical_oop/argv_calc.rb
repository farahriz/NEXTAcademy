puts "The result of your equation"
a = ARGV[0]
op = ARGV[1]
b = ARGV[2]

if op == '*' || op == 'x' || op == 'X'
	p a.to_f * b.to_f
else
	p a.to_f.send(op, b.to_f)
end