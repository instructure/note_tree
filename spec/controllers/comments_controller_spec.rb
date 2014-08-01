require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
login_user

  # This should return the minimal set of attributes required to create a valid
  # Comment. As you add validations to Course, be sure to
  # adjust the attributes here as well.
  let(:notebook){
    Notebook.create!(title: "Notebook", text: "This is a notebook", date: Date.today, lecture: lecture)
  }

  let(:course){
    Course.create!(short_name: "Hello", name: "Hello Again", description: "Tacos!", start_date: Date.today, end_date: Date.today)
  }

  let(:lecture){
    Lecture.create!(course: course, date: Date.today, title: "lecture title", summary:"Lecture summary")
  }

  let(:valid_attributes) {
    {
      "commenter" => "Colleen",
      "body" => "This is a comment.",
      "notebook" => notebook
    }
  }

  let(:invalid_attributes) {
    {
      "commenter" => "",
      "body" => "This is a comment.",
      "notebook" => notebook
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CommentssController. Be sure to keep this updated too.
  let(:valid_session) { {} }


  describe "POST create" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, {:notebook_id => notebook, :comment => valid_attributes}, valid_session
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, {:notebook_id => notebook, :comment => valid_attributes}, valid_session
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it "redirects to the Notebook with comment" do
        post :create, {:notebook_id => notebook, :comment => valid_attributes}, valid_session
        expect(response).to redirect_to(Notebook.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved course as @course" do
        post :create, {:course => invalid_attributes}, valid_session
        expect(assigns(:course)).to be_a_new(Course)
      end

      it "re-renders the 'new' template" do
        post :create, {:course => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

end
