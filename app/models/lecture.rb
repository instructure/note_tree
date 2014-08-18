class Lecture < ActiveRecord::Base
  belongs_to :course
  @course_id = '#{id}'

  validates :course, :date, :title, :summary, presence: true 
  validates :title, length: {within:1..50}
  validates :summary, length: {within:1..250} 

  def concat_id 
    "#{self.title}-#{self.date}"
  end

end

