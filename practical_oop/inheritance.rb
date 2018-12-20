class Animal
	attr_reader :number_of_limbs, :fav_food

	def initialize(number_of_limbs, fav_food)
		@number_of_limbs = number_of_limbs
		@fav_food		 = fav_food
	end

	def eat
		puts "Currently eating: #{fav_food}"
	end
end

class Monkey < Animal

	def climb
		puts "Climbing a tree"
	end

end

class Horse < Animal

	def gallop
		puts "Wandering the great wide yonder"
	end

end

monkey = Monkey.new(4, "banana")
monkey.eat
monkey.climb

horse = Horse.new(4, "grass")
horse.eat
horse.gallop