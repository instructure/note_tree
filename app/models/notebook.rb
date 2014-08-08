class Notebook < ActiveRecord::Base
	has_many :comments, dependent: :destroy

  has_paper_trail :on => [:update, :destroy]
	belongs_to :lecture 
  belongs_to :account
  validates :text, :title, presence: true
	validates :title, length: {within: 1..100}

  def version_comments
    # version = self.versions.last
    comments.select do |comment| 
      # version.created_at < comment.created_at
      self.updated_at < comment.created_at
    end
  end
end
 
