class Course < ActiveRecord::Base
  validates :short_name, :name, :start_date, :end_date, presence: true
  validates :short_name, length: {within: 1..50}
  validates :name, length: {within: 1..100}
end


