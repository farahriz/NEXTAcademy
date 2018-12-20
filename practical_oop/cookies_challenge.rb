# REQUIREMENTS
	# Make different types of cookies
	# Place batchs of cookies in an oven
	# Know when a batch of cookies is ready to be removed


# Different kind of cookies with different bake times
	# Peanut Butter
	# Chocolate chip
	# Traditional Sugar

class Cookie
	attr_accessor :doneness, :type, :time_in_oven

	def initialize(type)
		@doneness = "raw"
		@type = type
		@time_in_oven = 0
	end

#Baking state 
	def perfect?
		if @doneness == "perfect"
			true
		else
			false
		end
	end

	def bake!
		@time_in_oven += 1
	end

end


class Oven
	# needs to be able to store cookies and access them
	attr_accessor :cookies_inside

	def initialize
		@cookies_inside =[]
	end

# Place cookie in oven
	def place_oven(cookie)
		@cookies_inside << cookie
		self.cookies_inside.each {|x| x.bake!}
	end

# Remove cookies from oven
	def remove_oven(cookie)
		p cookie
	end
	
# Check cookies
	def check_cookie
		@cookies_inside
	end

# Wait and let cookies bake a little longer
	def wait!
		self.cookies_inside.each {|x| x.bake!}
	end

end

