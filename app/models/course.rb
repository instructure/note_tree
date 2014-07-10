class Course < ActiveRecord::Base
  has_many :lectures

  validates :short_name, :name, :start_date, :end_date, :description, presence: true
  validates :short_name, length: {within: 1..50}
  validates :name, length: {within: 1..100}
  validates :description, length: {within:1..500}
end

 def course
    collection = tags.where(course_id: id)
    collection.any? ? collection : courses.build
end
