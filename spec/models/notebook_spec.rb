# require_relative '../spec_helper'
require 'spec_helper'
require 'rails_helper'


describe Notebook do
	# before do
 #    	@notebook = Notebook.new
 #  	end

	it "should validate presence of title" do
		 validate_presence_of :title
	end

	it "should validate presence of date" do
		 validate_presence_of :date
	end 

	it "should validate presence of text" do
		 validate_presence_of :text
	end
end 