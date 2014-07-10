class Notebook < ActiveRecord::Base
	validates :text, :date, :title, presence: true
  validates :title, length: {within: 1..100}
  has_paper_trail
  
  validates :text, :date, :title, presence: true
	validates :title, length: {within: 1..100}
end
