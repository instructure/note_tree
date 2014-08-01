class Notebook < ActiveRecord::Base
	has_many :comments, dependent: :destroy
  validates :text, :date, :title, presence: true
  validates :title, length: {within: 1..100}

  has_paper_trail
	belongs_to :lecture 
  validates :text, :date, :title, presence: true
	validates :title, length: {within: 1..100}
end
 
