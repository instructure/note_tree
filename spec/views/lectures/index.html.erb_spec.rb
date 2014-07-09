require 'rails_helper'

RSpec.describe "lectures/index", :type => :view do
  before(:each) do
    assign(:lectures, [
      Lecture.create!(
        :course => nil,
        :title => "Title",
        :summary => "MyText"
      ),
      Lecture.create!(
        :course => nil,
        :title => "Title",
        :summary => "MyText"
      )
    ])
  end

  it "renders a list of lectures" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
