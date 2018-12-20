class Keyboard
	attr_reader :keys, :num_pad

	def initialize(type)
		@keys	 = true
		@num_pad = true
		@type 	 = type
	end
end

class Laptop
	attr_reader :screen, :usb_port
	
	def initialize(screen_size)
		@screen = Screen.new(screen_size)
		@usb_port = UsbPort.new
		@keyboard = Keyboard.new("Physical")
	end
end

class Phone
	def initialize(screen_size)
		@screen = Screen.new(screen_size)
		@keyboard = Keyboard.new("Touchscreen")
	end
end

class UsbPort
end

class Screen

	def initialize(size)
		@size = size
		@brightness = 50
	end

	def make_it_brigter
		@brightness += 10
	end
end