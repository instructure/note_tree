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

RSpec.describe LecturesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Lecture. As you add validations to Lecture, be sure to
  # adjust the attributes here as well.
  def valid_attributes
    {
      date: Date.tomorrow,
      title: "Title",
      summary: "Summary",
      course_id: @course.id
    }
  end

  def invalid_attributes
    {
      date: Date.tomorrow,
      summary: "Summary"
    }
  end

  def create_course
    @course = Course.create!(short_name: "Hello", name: "Hello Again", description: "Tacos!", start_date: Date.today, end_date: Date.today)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LecturesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all lectures as @lectures" do
      create_course
      lecture = Lecture.create! valid_attributes
      get :index, {:course_id => @course.id}, valid_session
      expect(assigns(:lectures)).to eq([lecture])
    end
  end

  describe "GET show" do
    it "assigns the requested lecture as @lecture" do
      create_course
      lecture = Lecture.create! valid_attributes
      get :show, {:course_id => @course.id, :id => lecture.to_param}, valid_session
      expect(assigns(:lecture)).to eq(lecture)
    end
  end

  describe "GET new" do
    it "assigns a new lecture as @lecture" do
      create_course
      get :new, {:course_id => @course.id}, valid_session
      expect(assigns(:lecture)).to be_a_new(Lecture)
    end
  end

  describe "GET edit" do
    it "assigns the requested lecture as @lecture" do
      create_course
      lecture = Lecture.create! valid_attributes
      get :edit, {:course_id => @course.id, :id => lecture.to_param}, valid_session
      expect(assigns(:lecture)).to eq(lecture)
    end
  end

  describe "POST create" do
    before do
      create_course
    end

    describe "with valid params" do
      it "creates a new Lecture" do
        expect {
          post :create, {:course_id => @course.id, :lecture => valid_attributes}, valid_session
        }.to change(Lecture, :count).by(1)
      end

      it "assigns a newly created lecture as @lecture" do
        post :create, {:course_id => @course.id, :lecture => valid_attributes}, valid_session
        expect(assigns(:lecture)).to be_a(Lecture)
        expect(assigns(:lecture)).to be_persisted
      end

      it "redirects to the created lecture" do
        post :create, {:course_id => @course.id, :lecture => valid_attributes}, valid_session
        lecture = Lecture.last
        expect(response).to redirect_to(course_lecture_path(@course, lecture))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved lecture as @lecture" do
        post :create, {:course_id => @course.id, :lecture => invalid_attributes}, valid_session
        expect(assigns(:lecture)).to be_a_new(Lecture)
      end

      it "re-renders the 'new' template" do
        post :create, {:course_id => @course.id, :lecture => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    before do
      create_course
    end

    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested lecture" do
        lecture = Lecture.create! valid_attributes
        put :update, {:course_id => @course.id, :id => lecture.to_param, :lecture => new_attributes}, valid_session
        lecture.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested lecture as @lecture" do
        lecture = Lecture.create! valid_attributes
        put :update, {:course_id => @course.id, :id => lecture.to_param, :lecture => valid_attributes}, valid_session
        expect(assigns(:lecture)).to eq(lecture)
      end

      it "redirects to the lecture" do
        lecture = Lecture.create! valid_attributes
        put :update, {:course_id => @course.id, :id => lecture.to_param, :lecture => valid_attributes}, valid_session
        expect(response).to redirect_to(course_lecture_path(@course, lecture))
      end
    end

    describe "with invalid params" do
      it "assigns the lecture as @lecture" do
        lecture = Lecture.create! valid_attributes
        put :update, {:course_id => @course.id, :id => lecture.to_param, :lecture => invalid_attributes}, valid_session
        expect(assigns(:lecture)).to eq(lecture)
      end
    end
  end

  describe "DELETE destroy" do
    before do
      create_course
    end

    it "destroys the requested lecture" do
      lecture = Lecture.create! valid_attributes
      expect {
        delete :destroy, {:course_id => @course.id, :id => lecture.to_param}, valid_session
      }.to change(Lecture, :count).by(-1)
    end

    it "redirects to the lectures list" do
      lecture = Lecture.create! valid_attributes
      delete :destroy, {:course_id => @course.id, :id => lecture.to_param}, valid_session
      expect(response).to redirect_to(course_lectures_url(@course))
    end
  end

end
