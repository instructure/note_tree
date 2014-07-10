class Notebook < ActiveRecord::Base
  has_paper_trail
  
	belongs_to :lecture 

  validates :text,:coures_id, :date, :title, :description, presence: true
	validates :title, length: {within: 1..100}
end
