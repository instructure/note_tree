class CoursesStudents < ActiveRecord::Migration
  def change
    create_table :courses_students, id: false do |t|
      t.belongs_to :course
      t.belongs_to :student
    end
  end
end
