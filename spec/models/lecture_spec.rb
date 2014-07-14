require 'rails_helper'
require 'spec_helper'

describe Lecture do 
  it "should validate presence of course" do
    lecture = Lecture.new ({
     
     
      })
    expect{ lecture.save! }.to raise_error
  end

  describe "#concat_id" do

    it "returns a concatenated title and date" do
      lecture = Lecture.new(title: "Heading")
      lecture.stub(:date) {"7-14-14"}
      expect(lecture.concat_id).to eq("Heading-7-14-14")
    end

  end
end