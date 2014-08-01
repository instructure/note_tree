require 'rails_helper'

RSpec.describe Comment, :type => :model do
 
  it "should validate presence of body" do
    comment = Comment.new({
      body: ""
    })
    expect{ comment.save! }.to raise_error
  end
  
  # it "should validate presence of commenter" do
  #   comment = Comment.new({
  #     commenter: ""
  #   })
  #   expect{ comment.save! }.to raise_error
  # end

end
