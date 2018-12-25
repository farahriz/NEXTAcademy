require 'sqlite3'

$db = SQLite3::Database.open "students.db"

class Student

	attr_accessor :first_name, :last_name, :email, :phone, :gender, :birthday

	def initialize(first_name, last_name, email, phone, gender, birthday)

		@first_name = first_name
		@last_name = last_name
		@email = email
		@phone = phone
		@gender = gender
		@birthday = birthday

	end

  # Add a new student
  def save
    q = "INSERT INTO students
          (first_name, last_name, email, phone, gender, birthday, created_at, updated_at)
        VALUES
          (?, ?, ?, ?, ?, ?, DATETIME('now'), DATETIME('now'));"

    $db.execute(q, 
      @first_name, @last_name, @email, @phone, @gender, @birthday)
  end
  
  # Delete a student -- based on student's id
  def self.delete(requirement)
    q = "DELETE FROM students
          WHERE id = ?;"
    $db.execute(q, requirement)
  end

  # # Show a list of all students
  def self.all
    q = "SELECT * FROM students"
    results = $db.execute(q)
    results.each do |row|
      puts row.join('|')
    end
  end

  # # Show a list of students with a particular first_name
  def self.get_first_name(arg)
    q ="SELECT * FROM students
          WHERE first_name = ?;"
    results = $db.execute(q, arg)
    results.each do |row|
      puts row.join('|')
    end
  end

  # Show a list of students with any particular attribute
  def self.where(field, requirement)
    q ="SELECT * FROM students
      WHERE #{field} = ?;"
    results = $db.execute(q, requirement)
    results.each do |row|
      puts row.join('|')
    end
  end

  # Show a list of students with any particular attribute
  def self.like(field, requirement)
    q ="SELECT * FROM students
      WHERE #{field} LIKE '#{requirement}';"
    results = $db.execute(q)
    results.each do |row|
      puts row.join('|')
    end
  end

  # Show a list of students with birthdays this month
  def self.birthday_month
    q = "SELECT * FROM students
          WHERE birthday
          ORDER BY birthday"
    results = $db.execute(q)
    results.each do |row|
      puts row.join('|')
    end
  end

  # Show a list of students organised by birthday
  def self.birthday_list
    q = "SELECT * FROM students 
    ORDER BY birthday"
    results = $db.execute(q)
    results.each do |row|
      puts row.join('|')
    end
  end

end

# Use ARGV to take input from the command line
ARGV

case ARGV[0]

when 'add'
  # (first_name, last_name, email, phone, gender, birthday)
  # Create a new instance of the a Student object
  new_student = Student.new(ARGV[1], ARGV[2], ARGV[3], ARGV[4], ARGV[5], ARGV[6])
  # Run the method save to store the student in the database
  new_student.save
when 'delete'
  # Delete a student according to Student's ID, as specified in ARGV[1]
  Student.delete(ARGV[1])
when 'all'
  Student.all
when 'first_name'
  Student.get_first_name(ARGV[1])
when 'where'
  Student.where(ARGV[1], ARGV[2])
when 'like'
  Student.like(ARGV[1], ARGV[2])
when 'birthday_list'
  Student.birthday_list
when 'birthday_this_month'
  Student.birthday_month
end