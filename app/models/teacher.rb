class Teacher < ActiveRecord::Base
  has_many :courses
  belongs_to :account
end
