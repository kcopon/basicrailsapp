class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @comment = current_user.comments.build(comment_params)
    @comment.posts = @comment
    authorize @comment

    if comment.save
      flash[:notice] = "Comment was saved"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end

  def destroy
  end
end

private

def comment_params
  params.require(:comment).premit(:body)
end