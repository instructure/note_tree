require 'rails_helper'

RSpec.describe "courses/index", :type => :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        :short_name => "Short Name",
        :name => "Name",
        :description => "MyText"
      ),
      Course.create!(
        :short_name => "Short Name",
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
