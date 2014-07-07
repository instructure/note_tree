class Notebook < ActiveRecord::Base
	validates :text, :date, :title, :description, presence: true
	validates :title, length: {within: 1..100}
end
