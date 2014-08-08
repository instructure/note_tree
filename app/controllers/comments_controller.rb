class CommentsController < ApplicationController
  def create
    @notebook = Notebook.find(params[:notebook_id])
    @comment = @notebook.comments.create(comment_params)
    # devise 
    @comment.account = current_account
    @comment.save
    redirect_to notebook_path(@notebook)
  end

  def destroy
    @notebook = Notebook.find(params[:notebook_id])
    @comment = @notebook.comments.find(params[:id]) 
    if current_account == @comment.account || current_account.teacher?
      @comment.destroy
      redirect_to notebook_path(@notebook)
    else
      render "shared/error"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
