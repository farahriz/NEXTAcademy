class Hospital
	def initialize
		@patients = []
		@employees = []
	end

	def list_patients
		@patients.each_with_index do |x, index|
			puts "#{index + 1}. #{x.name}"
		end
	end

	def add_patient(patient)
		@patients << patient
	end

	def view_records
    self.list_patients
    print "Patient No. : "
    num = gets.chomp!.to_i - 1
		@patients[num].records.each_with_index do |x, index|
			puts "#{index + 1}. #{x}"
		end
	end

	def add_employee(employee)
		@employees << employee
	end

	def login(username, password)
		results = @employees.select do |x|
			x.username == username && x.check_password(password)
		end
		results[0]
	end
end

class Patient
	attr_reader :name, :records
	def initialize(name)
		@name = name
		@records = []
	end

	def add_record(record)
		@records << record
	end
end

class User
	attr_reader :username, :role
	def initialize(username, password)
		@username = username
		@password = password
	end

	def check_password(password)
		@password == password # => true || false
	end
end

class Doctor < User
	def initialize(username, password)
		super(username, password)
		@role = "DOCTOR"
	end
end

class SuperAdmin < User
	def initialize(username, password)
		super(username, password)
		@role = "SUPER ADMIN"
	end
end

# Setup Code ============================================

hospital = Hospital.new
doctor = Doctor.new("Nicholas", "123456")
admin = SuperAdmin.new("Sophie", "654321")
patient1 = Patient.new("Extra1")
patient2 = Patient.new("Extra2")
hospital.add_employee(doctor)
hospital.add_employee(admin)
hospital.add_patient(patient1)
hospital.add_patient(patient2)

# Setup Code ============================================

# Driver Code ============================================

divider = "-------------------------------"
puts "Welcome to NEXT Hospital"
puts divider
print "Please enter your username: "
username = gets.chomp!
print "Please enter your password: "
password = gets.chomp!
puts divider
user = hospital.login(username, password) # => nil || Doctor || SuperAdmin
if user != nil
	puts "Welcome, #{user.username}. Your access level is: #{user.role}"
	doctor_options = ["List patients", "View records", "Add Record", "Remove record"]
	admin_options = ["List employees"]
	resulting_options = doctor_options
	if user.role == "SUPER ADMIN"
		resulting_options += admin_options
	end
	resulting_options += ["Exit"]
	while true
		puts "What would you like to do?"
		resulting_options.each_with_index do |opt, index|
			puts "#{index + 1}. #{opt}"
		end
		print "Option No. : "
		num = gets.chomp!.to_i - 1
		system('clear')
    chosen_option = resulting_options[num]

    # Handle options ===========================================================================

		case chosen_option
		when "List patients"
			puts "List patients"
			hospital.list_patients
		when "View records"
			puts "View records"
			hospital.view_records
		when "Exit"
			break
		else
			puts "Bad Option!"
    end
    
    # Handle options ===========================================================================

		puts divider
	end
else
	puts "Bad Login"
end

# Driver Code ============================================