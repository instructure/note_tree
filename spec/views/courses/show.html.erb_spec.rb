require 'rails_helper'

RSpec.describe "courses/show", :type => :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :short_name => "Short Name",
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Short Name/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
