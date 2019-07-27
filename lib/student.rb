class Student
  attr_accessor :name, :grade
  attr_reader :id
  
  def  initialize(name, grade, id=nil)
    @name = name
    @grade = grade
    @id = id
  end
  
  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS students (
      ID INTEGER PRIMARY KEY,
      name TEXT,
      grade INTEGER)
     SQL
     DB[:conn].execute(sql)
  end 
  
  def self.drop_table
    sql = <<-SQL
    DROP TABLE students
    SQL
    DB[:conn].execute(sql)
  end

   def save
     #row created by instances
     sql = <<-SQL
     INSERT INTO students (name, grade)
     VALUES (?,?)
     SQL
     DB[:conn].execute(self.name, self.grade)
   end
  
end











 # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]