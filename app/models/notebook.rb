class Notebook < ActiveRecord::Base
	validates :text, :title, presence: true
  validates :title, length: {within: 1..100}

  has_paper_trail
	belongs_to :lecture 
  validates :text, :title, presence: true
	validates :title, length: {within: 1..100}
end
 
