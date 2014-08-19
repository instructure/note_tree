class Notebook < ActiveRecord::Base
	has_many :comments, dependent: :destroy

  has_paper_trail :on => [:update, :destroy]
	belongs_to :lecture 
  belongs_to :account
  validates :text, :title, presence: true
	validates :title, length: {within: 1..25}

  def version_comments
    comments.select do |comment| 
      self.updated_at < comment.created_at
    end
  end
end
 
