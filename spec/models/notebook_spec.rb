# require_relative '../spec_helper'
require 'spec_helper'
require 'rails_helper'

describe Notebook do
	# before do
 #    	@notebook = Notebook.new
 #  	end

	it "should validate presence of date" do
		notebook = Notebook.new({
			title: "lalatoday",
			text: "tacos!"
			})

		expect{ notebook.save! }.to raise_error
	end

	it "should validate presence of title" do
		notebook = Notebook.new({
			date: Date.today,
			text: "tacos!"
			})
		expect{ notebook.save! }.to raise_error
	end 

	it "should validate presence of text" do
		 notebook = Notebook.new({
			title: "text",
			date: "tacos!"
			})
		 expect{ notebook.save! }.to raise_error
	end
end 