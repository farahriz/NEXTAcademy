#Define custom exception class
class NoOrangesError < StandardError
end

#Define the tree
class OrangeTree
	attr_accessor :height, :age, :oranges

	def initialize
		@age = 0
		@height = 0	
		@oranges = []
	end

	def dead?
		if @age>5
			true
		else
			false
		end
	end

	def any_oranges?
		if @oranges.length > 0
			true
		else
			false
		end
	end

	def age!
		# should age the tree by one year
		@age += 1
		# should grow the tree's height a little
		if @age < 5
			@height += rand(1..3)
		else
			@height += 0.5
		end

		# should bear fruits once it's 3 years old.
		if age >=3
			growth = rand(1..5)

			growth.times do
				@oranges << Orange.new
			end
		end
	end

	def add_orange(new_orange)
		@oranges << new_orange
	end

	def pick_an_orange!
		raise  NoOrangesError, 'This tree has no oranges. You can\'t pick oranges where none exist.' unless self.any_oranges?
		@oranges.pop
	end
	
end

class Orange
	attr_accessor :diameter

	def initialize
		@diameter=rand(10.0..20.00)
	end
end


tree = OrangeTree.new

tree.age! until tree.any_oranges?

puts "Tree is #{tree.age} years old and #{tree.height} feet tall"
puts "The tree has #{tree.oranges.length} oranges on it."

until tree.dead?
  basket = []

  # It places the oranges in the basket
  while tree.any_oranges?
    basket << tree.pick_an_orange!
  end


  def average_basket(basket)
	if basket != []
	    total = 0.0
	  	basket.each {|x|
	  		total += x.diameter.to_f
	  	}
	  	return total/basket.size
	end 	
  end

  avg_diameter = average_basket(basket).round(3s)
  
  puts "Year #{tree.age} Report"
  puts "Tree height: #{tree.height} feet"
  puts "Harvest: #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
  puts ""

  # Age the tree another year
  tree.age!
end

puts "Alas, the tree, she is dead!"
# 