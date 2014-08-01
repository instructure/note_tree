class Comment < ActiveRecord::Base
  belongs_to :notebook
  belongs_to :account

  validates :body, presence: true
end
