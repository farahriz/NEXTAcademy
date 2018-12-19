# WRITE CODE IN THE CLASSES SO YOU CAN DO YOUR DRIVER CODE
class Cart
	attr_accessor :cart_contents

	def initialize
		@cart_contents = []
	end

	def add_product(product)
		@cart_contents.push(product)
	end

	def list_all_prices
		self.cart_contents.each {|x|
			p x.price
		}
	end

	def list_all_products
		self.cart_contents.each {|x|
			p x.name
		}
	end

	def total_amount
		total = 0
		self.cart_contents.each {|x|
			total = total + x.price
		}
		p total
	end
end

class Product
	attr_accessor :name, :price

	def initialize(name, price)
		@name 	= name
		@price 	= price
	end
end

# DRIVER CODE - DO NOT CHANGE
chromecast = Product.new("Chrome Cast", 300) # name and price
monitor = Product.new("Samsung Monitor", 150)

my_cart = Cart.new
my_cart.add_product(chromecast)
my_cart.add_product(monitor)

# my_cart.total_amount
#END OF DRIVER CODE - DO NOT CHANGE