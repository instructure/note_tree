class Notebook < ActiveRecord::Base
	has_many :comments, dependent: :destroy

  has_paper_trail :on => [:update, :destroy]
	belongs_to :lecture 
  validates :text, :title, presence: true
	validates :title, length: {within: 1..100}

  def version_comments
    version = self.versions.last
    comments.select do |comment| 
      version.created_at < comment.created_at
    end
  end
end
 
