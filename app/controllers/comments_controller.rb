class CommentsController < ApplicationController
  def create
    @notebook = Notebook.find(params[:notebook_id])
    @comment = @notebook.comments.create(comment_params)
    redirect_to notebook_path(@notebook)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
