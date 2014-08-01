class Comment < ActiveRecord::Base
  belongs_to :notebook

  validates :body, :commenter, presence: true
end
