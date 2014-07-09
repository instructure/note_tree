class Notebook < ActiveRecord::Base
<<<<<<< HEAD
	validates :text, :date, :title, presence: true
  validates :title, length: {within: 1..100}
=======
  has_paper_trail
  
  validates :text, :date, :title, presence: true
	validates :title, length: {within: 1..100}
>>>>>>> 544bf0c0b40b5793034de98468fadfd875f9755d
end
