class Comment < ActiveRecord::Base
  belongs_to :notebook
  belongs_to :account

  validates :body, :commenter, presence: true
end
