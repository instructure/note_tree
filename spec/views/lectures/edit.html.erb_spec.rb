require 'rails_helper'

RSpec.describe "lectures/edit", :type => :view do
  before(:each) do
    @lecture = assign(:lecture, Lecture.create!(
      :course => nil,
      :title => "MyString",
      :summary => "MyText"
    ))
  end

  it "renders the edit lecture form" do
    render

    assert_select "form[action=?][method=?]", lecture_path(@lecture), "post" do

      assert_select "input#lecture_course_id[name=?]", "lecture[course_id]"

      assert_select "input#lecture_title[name=?]", "lecture[title]"

      assert_select "textarea#lecture_summary[name=?]", "lecture[summary]"
    end
  end
end
