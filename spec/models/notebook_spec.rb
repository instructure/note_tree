# require_relative '../spec_helper'
require 'spec_helper'
require 'rails_helper'

describe Notebook do
	# login_user

  let(:account){
    Account.create!(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password', 
      :first_name => 'Colleen', :last_name => 'Masterson')
  }

  let(:course){
    Course.create!(short_name: "Hello", name: "Hello Again", description: "Tacos!", start_date: Date.today, end_date: Date.today)
  }

  let(:lecture){
    Lecture.create!(course: course, date: Date.today, title: "lecture title", summary:"Lecture summary")
  }

  let(:comment){
  	Comment.create!(body: "This is a comment.", notebook_id: notebook, account_id: account)
  }


	it "should validate presence of title" do
		notebook = Notebook.new({
			text: "tacos!"
			})
		expect{ notebook.save! }.to raise_error
	end 

	it "should validate presence of text" do
		 notebook = Notebook.new({
			title: "text"
			})
		 expect{ notebook.save! }.to raise_error
	end

	it "should show comments for current notebook version" do
		notebook = Notebook.new(title: "Notebook", text: "This is a notebook.", lecture: lecture)
		comment = comment
		notebook.stub(:text) {"this is new text"}
		notebook.save
		expect(notebook.version_comments). to eq([])
	end
end 