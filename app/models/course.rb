class Course < ActiveRecord::Base
  has_many :lectures
  has_and_belongs_to_many :students
  has_and_belongs_to_many :teachers

  validates :short_name, :name, :start_date, :end_date, :description, presence: true
  validates :short_name, length: {within: 1..10}
  validates :name, length: {within: 1..100}
  validates :description, length: {within:1..75}

  def values_for_lecture_ids
    lectures.collect { |l| [l.concat_id, l.id]} 
  end

end
