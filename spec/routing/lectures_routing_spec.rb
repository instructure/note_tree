require "rails_helper"

RSpec.describe LecturesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/courses/1/lectures").to route_to("lectures#index", :course_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/courses/1/lectures/new").to route_to("lectures#new", :course_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/courses/1/lectures/1").to route_to("lectures#show", :course_id => "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/courses/1/lectures/1/edit").to route_to("lectures#edit", :course_id => "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/courses/1/lectures").to route_to("lectures#create", :course_id => "1")
    end

    it "routes to #update" do
      expect(:put => "/courses/1/lectures/1").to route_to("lectures#update", :course_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/courses/1/lectures/1").to route_to("lectures#destroy", :course_id => "1", :id => "1")
    end

  end
end
