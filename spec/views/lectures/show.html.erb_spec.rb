require 'rails_helper'

RSpec.describe "lectures/show", :type => :view do
  before(:each) do
    @lecture = assign(:lecture, Lecture.create!(
      :course => nil,
      :title => "Title",
      :summary => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
