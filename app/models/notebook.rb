class Notebook < ActiveRecord::Base
  has_paper_trail
  
  validates :text, :date, :title, presence: true
	validates :title, length: {within: 1..100}
end
