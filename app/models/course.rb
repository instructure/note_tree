class Course < ActiveRecord::Base
  has_many :lectures
  validates :short_name, :name, :start_date, :end_date, :description, presence: true
  validates :short_name, length: {within: 1..10}
  validates :name, length: {within: 1..100}
  validates :description, length: {within:1..500}

  def values_for_lecture_ids
    lectures.collect { |l| [l.concat_id, l.id]} 
  end

end
