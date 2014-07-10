class Lecture < ActiveRecord::Base
  belongs_to :courses
  validates :course_id, :date, :title, :summary, presence: true 
  validates :title, length: {within:1..100}
  validates :summary, length: {within:1..500} 
end