require 'sqlite3'

# If you want to overwrite your database you will need
# to delete it before running this file

$db = SQLite3::Database.new "students.db"

module StudentDB
  def self.setup
    $db.execute(
      <<-SQL
        CREATE TABLE students (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          -- ADD THE ADDITIONAL ATTRIBUTES HERE!
          email VARCHAR(64) NOT NULL,
          phone VARCHAR(64) NOT NULL,
          gender VARCHAR(64) NOT NULL,
          birthday DATETIME NOT NULL,
          -- END OF ADDITIONAL ATRRIBUTES
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    # Add a few records to your database when you start
    $db.execute(
      <<-SQL
        INSERT INTO students
          (first_name, last_name, email, phone, gender, birthday, created_at, updated_at)
        VALUES
          ('John','Lee', 'johnlee@example.com', '0123456789', 'male', '17/12/1989', DATETIME('now'), DATETIME('now')),
          ('Tyson','Kramer', 'tykr@boxbox.com', '01236536789', 'male', '01/04/1962', DATETIME('now'), DATETIME('now')),
          ('Buddy','Rich', 'bernardrich@jazz.com', '0923456734', 'male','30/09/1917', DATETIME('now'), DATETIME('now'))
          ;
      SQL
    )
  end
end