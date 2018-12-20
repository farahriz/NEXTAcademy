class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost, :address

  def initialize(components={})
    @address      = components[:address]
    @square_feet  = components[:square_feet]
    @num_bedrooms = components.fetch(:num_bedrooms, 3)
    @num_baths    = components.fetch(:num_baths, 2)
    @cost         = components.fetch(:cost, 320000)
    @down_payment = components.fetch(:down_payment, 0.20)
    @sold         = components.fetch(:sold, false)
    @has_tenants  = components.fetch(:has_tenants, false)
  end

  def obscure_address
    @address.sub(/\A\d*/, '****')
  end

  def buy!(money, good_credit)
    @sold = true if money >= down_payment && good_credit
  end

  def down_payment
    cost * @down_payment
  end

  def to_s
    "#{obscure_address} : #{square_feet} sq. ft., #{num_bedrooms} bed, #{num_baths} bath. $#{cost}"
  end
end

tyersal =  House.new({:address => "Tyersall Park"})
p tyersal.address
p tyersal.num_bedrooms
p tyersal

truman = House.new(address: "Truman")
p truman