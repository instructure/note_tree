class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :ensure_teacher, except: [:index, :show, :enroll_student]
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new    
    @course = Course.new
    
  end

  # GET /courses/1/edit
  def edit
    respond_to do |format|
    if  @course.teachers.include?(current_account.teacher)

        format.html { render :edit, notice: 'Course was successfully updated.' }
        format.json { render :edit, status: :ok, location: @course }
      else
        format.html { render :show, notice: 'YOU CANNOT DO THAT.' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        @course.teachers << current_account.teacher
        @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    respond_to do |format|
      if @course.teachers.include?(current_account.teacher)
        @course.destroy
        format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      else 
        format.html { redirect_to @course, notice: 'Course was not successfully destroyed ' }
      end 
    end
  end

  def enroll_student
    @course = Course.find(params[:course_id])
    student = Student.find(params[:id])
    @course.students << student
    redirect_to @course, notice: 'Course was successfully updated.'
  end

  def enroll_teacher
    @course = Course.find(params[:course_id])
    teacher = Teacher.find(params[:id])
    @course.teachers << teacher
    redirect_to @course, notice: 'Course was successfully updated.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:short_name, :name, :description, :start_date, :end_date)
    end
    
   def ensure_teacher
    render "shared/error" unless current_account.teacher?
   end

end
