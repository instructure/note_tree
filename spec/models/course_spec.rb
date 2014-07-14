require 'rails_helper'

RSpec.describe Course, :type => :model do

  describe "#values_for_lecture_ids" do

    let(:course) {Course.new}
    let(:lecture) { Lecture.new(id: 2, title: "Title") }
    let(:expected) {
      [
        ["Title-2014-07-14", 2]
      ]
    }

    context "when course has no lectures" do
      it "creates an empty array" do
        expect(course.values_for_lecture_ids).to eq([])
      end
    end

    context "When course has lectures" do 

      before do
        lecture.stub(:date) { "2014-07-14" }
        course.stub(:lectures) { [lecture] }
      end

      it "creates an array of titles and dates" do
        expect(course.values_for_lecture_ids).to eq(expected)
      end

    end

  end


end
