require 'rails_helper'
require 'spec_helper'

describe Lecture do 
  it "should validate presence of course" do
    lecture = Lecture.new ({
     
     
      })
    expect{ lecture.save! }.to raise_error
end

end