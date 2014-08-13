class Student < ActiveRecord::Base 
  has_and_belongs_to_many :courses
  belongs_to :account

  def is_enrolled?(course)
    course.students.include?(self)
  end
end
