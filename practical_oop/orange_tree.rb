#Define the tree
class OrangeTree
	attr_accessor :height, :age

	def initialize
		@age = 0
		@height = 0
		
	end

	def dead?
		
	end

	def any_oranges?
		
	end

	def age!
		
	end

	def pick_an_orange!
		
	end
	
end

class Orange
	attr_accessor :diameter

	def initialize
		@diameter=14
	end
end



# Plant a orange tree
tree = OrangeTree.new
# Wait for orange tree to grow
tree.age! until tree.any_oranges?

# When it is 3 years old
#   Orange tree will start to bear fruits 
# When orange tree has fruits
#   Pick all the oranges from the tree




puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

until tree.dead?
  basket = []

  # It places the oranges in the basket
  while tree.any_oranges?
    basket << tree.pick_an_orange!
  end

  avg_diameter = # It's up to you to calculate the average diameter for this harvest.

  puts "Year #{tree.age} Report"
  puts "Tree height: #{tree.height} feet"
  puts "Harvest: #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
  puts ""

  # Age the tree another year
  tree.age!
end

puts "Alas, the tree, she is dead!"