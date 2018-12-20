class BankAccount
	attr_reader :password
	def initialize(password)
		@password 	= password
		@balance 	= rand(1000)
	end

	def return_balance(password)
		return @balance if check_user_password(password)
	end

	private
		def check_user_password(password)
			return true if password == @password
		end
end

class Person
	attr_reader :bank_account

	def initialize(password)
		@bank_account=BankAccount.new(password)
	end

	def check_bank_balance(password)
		balance = 0
		if balance = @bank_account.return_balance(password)
			return balance
		else
			return 'Unauthorised!'
		end
	end
end	

tim = Person.new('abcdefg')

p tim.check_bank_balance('abcdefg')
# p tim.bank_account.check_user_password('abcdefg')	