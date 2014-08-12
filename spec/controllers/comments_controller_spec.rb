require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
# login_teacher

  # This should return the minimal set of attributes required to create a valid
  # Comment. As you add validations to Course, be sure to
  # adjust the attributes here as well.
  let(:account){
    Account.create!(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password', 
      :first_name => 'Colleen', :last_name => 'Masterson')
  }

  let(:notebook){
    Notebook.create!(title: "Notebook", text: "This is a notebook", lecture: lecture)
  }

  let(:course){
    Course.create!(short_name: "Hello", name: "Hello Again", description: "Tacos!", start_date: Date.today, end_date: Date.today)
  }

  let(:lecture){
    Lecture.create!(course: course, date: Date.today, title: "lecture title", summary:"Lecture summary")
  }

  let(:valid_attributes) {
    {

      "body" => "This is a comment.",
      "notebook" => notebook,
      "account" => account
    }
  }

  let(:invalid_attributes) {
    {
      "body" => "",
      "notebook" => notebook,
      "account" => account
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CommentssController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before :each do
    @teacher = login_teacher
  end

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

      it 'assigns user as commenter' do
        @comment = Comment.create! valid_attributes
        expect(@comment.account).to be_a(Account)
      end 
    end

    describe "with invalid params" do
      it "redirects to Notebook" do
        post :create, {:notebook_id => notebook, :comment => invalid_attributes}, valid_session
        expect(response).to redirect_to(Notebook.last)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested  comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, {:notebook_id => notebook, :id => comment.to_param}, valid_session
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the notebook list" do
      comment = Comment.create! valid_attributes
      delete :destroy, {:notebook_id => notebook, :id => comment.to_param}, valid_session
      expect(response).to redirect_to(Notebook.last)
    end

    it "does not allow student non-owners to delete a comment" do
      comment = Comment.create! valid_attributes
      new_student = Student.create!
      student = Account.create(:password => "Password_student", :password_confirmation => "Password_student", :email => "test2@email.com", :student => new_student)    
      sign_in student
      delete :destroy, {:notebook_id => notebook, :id => comment.to_param}, valid_session
      expect(response).to render_template(:error)
    end 

    it "allows teachers to delete comments" do
      login_student
      comment = Comment.create! valid_attributes
      new_teacher = Teacher.create!
      teacher = Account.create(:password => "Password_student", :password_confirmation => "Password_student", :email => "testteacher@email.com", :teacher => new_teacher)    
      sign_in teacher
      expect {
        delete :destroy, {:notebook_id => notebook, :id => comment.to_param}, valid_session
      }.to change(Comment, :count).by(-1)
    end
  end

end
