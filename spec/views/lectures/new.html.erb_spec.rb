require 'rails_helper'

RSpec.describe "lectures/new", :type => :view do
  before(:each) do
    assign(:lecture, Lecture.new(
      :course => nil,
      :title => "MyString",
      :summary => "MyText"
    ))
  end

  it "renders new lecture form" do
    render

    assert_select "form[action=?][method=?]", lectures_path, "post" do

      assert_select "input#lecture_course_id[name=?]", "lecture[course_id]"

      assert_select "input#lecture_title[name=?]", "lecture[title]"

      assert_select "textarea#lecture_summary[name=?]", "lecture[summary]"
    end
  end
end
