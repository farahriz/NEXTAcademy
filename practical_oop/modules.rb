module PetActions
	def communicate
		puts @sound
	end
end

class Dog
	include PetActions

	# attr_accessor :sound

	def initialize
		@sound = "bark"
	end

	def shows_happiness
		puts "wags tail"
	end

	# def communicate
	# 	puts @sound
	# end

end


class Cat
	attr_accessor :sound

	def initialize
		@sound = "meow"
	end

	def shows_indifference 
		puts "lazes in a corner while eye-ing you"
	end

	include PetActions

end

