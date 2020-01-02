class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(required_parameters)
    redirect_to post_path(@post)
    flash[:alert] = "Comment sucessfully added"
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
    flash[:alert] = "Comment sucessfully deleted"
  end

  private

    def required_parameters
      params.require(:comment).permit(:name, :commentText, :post_id)
    end

end
