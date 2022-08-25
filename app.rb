require_relative 'lib/database_connection'
require_relative 'lib/student'
require_relative 'lib/student_repository'

DatabaseConnection.connect('students_cohort')

students_object = StudentRepository.new
students_object.all
p "*****************"
students_object.print_students_cohorts
p "*****************"
students_object.print_students_names