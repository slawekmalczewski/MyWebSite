class PostsController < ApplicationController

  layout "admin"

  before_action :check_login, :except => [:login, :loginProcess, :logout]

  def index
    @post = Post.paginate(:page => params[:page], :per_page => 4)
  end

  def new
    @post_category = PostCategory.all
  end

  def create
    @post = Post.new(required_parameters)
    if @post.save
      flash[:success] = "Post sucessfully created"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @post = Post.find(params[:id])
    @post_category = PostCategory.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(required_parameters)
      flash[:success] = "Post sucessfully updated"
      redirect_to(:action => 'show', :id => @post.id)
    else
      render('edit')
    end
  end

  def show
    @post = Post.find(params[:id])
    render layout: 'public'
  end

  def delete
    @post = Post.find(params[:id])
  end

  def confirm_deletion
    post = Post.find(params[:id]).destroy
    flash[:success] = "Post sucessfully deleted"
    redirect_to(:action => 'index')
  end

private

  def required_parameters
    params.require(:post).permit(:Post_Title, :Post_Author, :Post_Body, :Post_Visibility, :post_category_id, :postHeaderPhoto, uploads: [])
  end

end
