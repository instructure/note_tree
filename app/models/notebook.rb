class Notebook < ActiveRecord::Base
	belongs_to :lecture 
  validates :text, :date, :title, :description, presence: true
	validates :title, length: {within: 1..100}
end
