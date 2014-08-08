require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe NotebooksController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Lecture. As you add validations to Lecture, be sure to
  # adjust the attributes here as well.
  def valid_attributes
    {
      title: "Title",
      lecture_id: @lecture.id,
      text: "text"
    }
  end

  def invalid_attributes
    {
      summary: "Summary"
    }
  end

  def course_variable
    @course = Course.create({

      short_name: "Short Course Name",
      name: "Course Name",
      description: "Course description",
     
      })
    @lecture = Lecture.create({
      course: @course,
  
      title: "lecture title", 
      summary:"Lecture summary"

      })
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LecturesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before :each do
    @user = login_student
  end

  describe "GET index" do
    let(:notebook) {Notebook.new}
    before do
      Notebook.stub(:all) { [notebook] }
    end

    it "assigns all lectures as @lectures" do
      get :index, {}, valid_session
      expect(assigns(:notebooks)).to eq([notebook])
    end

  end

  describe "GET new" do

    let(:course) { Course.new(id: 1) }
    let(:lecture) { Lecture.new(id: 2, title: "Title") }

    before do                                   
      Course.stub(:find) { course }
      lecture.stub(:date) { "2014-07-14" }
      course.stub(:lectures) { [lecture] }
    end

    let(:expected) {
      [
        ["Title-2014-07-14", 2]
      ]
    }

    it "assigns a new notebook as @notebook" do
      get :new, { course_id: 1 }, valid_session
      expect(assigns(:notebook)).to be_a_new(Notebook)
    end

    it "assigns lecture ids to @lectures" do
      get :new, { course_id: 1 }, valid_session
      expect(assigns(:lectures)).to eq(expected)
    end

  end

  describe "GET edit" do
    # let(:account) {Account.new(student_id: 1)}
    let(:course) { Course.new(id: 4) }
    let(:lecture) { Lecture.new(id: 3, title: "this is also a title") }
    let(:notebook) { Notebook.new()}
    let(:expected) { 
      [
        ["this is also a title-2014-08-14", 3]
      ]
    }
    before do
      Notebook.stub(:find) { notebook }
      notebook.stub(:account) { @user }
      notebook.stub(:lecture) { lecture }
      lecture.stub(:course) {course}
      course.stub(:lectures) { [lecture] }
      lecture.stub(:date) { "2014-08-14" }
    end

    it "allows the owner to edit the notebook" do
      get :edit, {id: 1}, valid_session
      expect(response).to be_successful
    end


    it "does not allow non-owners to edit the notebook" do
      new_student = Student.create!
      user = Account.create(:password => "Password_student", :password_confirmation => "Password_student", :email => "test2@email.com", :student => new_student)
      notebook.stub(:account) { user }
      get :edit, {id: 1}, valid_session
      expect(response).to render_template(:error)
    end
  end

    describe "POST create" do
      let(:notebook) { Notebook.new(id: 1) }
      before do
        course_variable
       end

    describe "with valid params" do

      it "is successful" do
        post :create, {notebook: { text: 'ohai'} }
        expect(response).to be_successful
      end
      it "creates a new Notebook" do
         expect { 
         post :create, {:notebook => valid_attributes}, valid_session
         }.to change(Notebook, :count).by(1)
      end
      it "redirects to the new notebook path" do
        post :create, {:notebook => valid_attributes}, valid_session
        notebook_id = Notebook.last.id
        expect(response).to redirect_to(notebook_path(notebook_id))
      end
      end
    end

   describe "DELETE destroy" do
     it "destroys the requested notebook" do
      course_variable
      notebook = Notebook.create!(valid_attributes)
      notebook.account = @user
      notebook.save
      expect {
        delete :destroy, { :id => notebook}, valid_session
      }.to change(Notebook, :count).by(-1)
      end

      it "doesn't allow non student owners to delete notebook" do
        course_variable
        notebook = Notebook.create(valid_attributes)
        new_student = Student.create!
        user = Account.create(:password => "Password_student", :password_confirmation => "Password_student", :email => "test2@email.com", :student => new_student)
        notebook.stub(:account) { user }
        delete :destroy, {:id => notebook}, valid_session
        expect(response).to render_template(:error)
      end

      it "allows teachers to delete any notebook" do 
        course_variable
        notebook = Notebook.create(valid_attributes)
        new_teacher = Teacher.create!
        teacher = Account.create(:password => "Password_teacher", :password_confirmation => "Password_teacher", :email => "test2@email.com", :teacher => new_teacher)
        notebook.stub(:account) { teacher }
        delete :destroy, {:id => notebook}, valid_session
        expect(response).to be_successful
        end
    end
end