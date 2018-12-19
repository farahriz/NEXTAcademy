
class Human
	attr_reader :name, :age, :address, :phone_num, :email, :height, :weight

	def initialize(**components)
		@name 		= components[:name]
		@age		= components[:age]
		@address	= components[:address]
		@phone_num	= components[:phone_num]
		@email 		= components[:email]
		@height		= components[:height]
		@weight		= components[:weight]
	end
end

ben = Human.new({:name => "Ben", :age => 25, :address => "Glomac Damansara, TTDI", :phone_num => "0123456789", :email => "ben@gmail.com", :height => 178, :weight => 70})
p ben.name

class Pet
	attr_reader :name, :species

	def initialize(**components)
		@name	 = components[:name]
		@species = components[:species]
	end
end

spike = Pet.new({:name => "Spike", :species => "Dog"})
lulu = Pet.new({:species => "Cat", :name =>"Lulu"})

p spike.name
p lulu.name
