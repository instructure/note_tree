class NotebooksController < ApplicationController
  # before_action :authenticate_account! 
  before_action :set_notebook, only: [:show, :edit, :update, :destroy]

  # GET /notebooks
  # GET /notebooks.json
  def index
    @notebooks = Notebook.all
  end

  # GET /notebooks/1
  # GET /notebooks/1.json
  def show
    @comment = Comment.new
  end

  # GET /notebooks/new
  def new
    @notebook = Notebook.new
    course = Course.find(params[:course_id])
    @lectures  = course.values_for_lecture_ids
  end

  # GET /notebooks/1/edit
  def edit
    if current_account == @notebook.account
      course = @notebook.lecture.course
      @lectures  = course.values_for_lecture_ids  
      render :edit
    else
      render "shared/error"
    end
  end

  # POST /notebooks
  # POST /notebooks.json
  def create
    @notebook = Notebook.new(notebook_params)
    @notebook.account = current_account
    #debugger
    respond_to do |format|
      if @notebook.save

        format.html { redirect_to @notebook, notice: 'Notebook was successfully created.' }
        #format.json { render :show, status: :created, location: @notebook }
      else
        #debugger
        format.html { render :new }
        #format.json { render json: @notebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notebooks/1
  # PATCH/PUT /notebooks/1.json
  def update
    respond_to do |format|
   
      if @notebook.update(notebook_params)
        format.html { redirect_to @notebook, notice: 'Notebook was successfully updated.' }
        #format.json { render :show, status: :ok, location: @notebook }
      else
        format.html { render :edit }
        #format.json { render json: @notebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notebooks/1
  # DELETE /notebooks/1.json
  def destroy
    if current_account == @notebook.account || current_account.teacher?
      @notebook.destroy
      respond_to do |format|
        format.html { redirect_to notebooks_url, notice: 'Notebook was successfully destroyed.' }
        #format.json { head :no_content }
      end
    else
      render "shared/error"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notebook
      @notebook = Notebook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notebook_params
      params.require(:notebook).permit(:lecture_id, :text, :title, :account_id)
    end
end
