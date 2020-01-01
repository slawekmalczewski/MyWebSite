class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(required_parameters)
    redirect_to post_path(@post)
  end

  def destroy
  end

  private

    def required_parameters
      params.require(:comment).permit(:name, :commentText, :post_id)
    end

end
