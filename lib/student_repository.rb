require_relative "student"

class StudentRepository

    def all
        sql = 'SELECT * FROM students;'
        result = DatabaseConnection.exec_params(sql, [])
        @students_list = []
        result.each do |student|
            student_sample = Student.new
            methods = [:id, :student_name, :cohort]
            methods.each do |m| 
                student_sample.send("#{m}=", student[m.to_s]) # <<< Inception vibes
            end
            @students_list << student_sample
            puts "Student ID # #{student_sample.id}: #{student_sample.student_name} part of cohort #{student_sample.cohort}"
        end
        return @students_list
    end

    def print_students_names
        sql = 'SELECT student_name FROM students;'
        result = DatabaseConnection.exec_params(sql, [])
        @students_name_list = []
        result.each do |student|
            @students_name_list << student["student_name"]
        end
        count = 0
        @students_name_list.each do |cohort|
            count += 1
            puts "Student # #{count}: #{cohort}"
        end
        return @students_name_list
    end

    def print_students_cohorts
        sql = 'SELECT cohort FROM students;'
        result = DatabaseConnection.exec_params(sql, [])
        @cohort_list = []
        result.each do |student|
            if @cohort_list.include?(student["cohort"])
            else
                @cohort_list << student["cohort"]
            end
            
        end
        count = 0
        @cohort_list.each do |cohort|
            count += 1
            puts "Cohort # #{count}: #{cohort}"
        end
        return @cohort_list
    end

end