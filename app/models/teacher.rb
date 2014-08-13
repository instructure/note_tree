class Teacher < ActiveRecord::Base
  has_and_belongs_to_many :courses
  belongs_to :account
  def is_enrolled?(course)
    course.teachers.include?(self)
  end
end
