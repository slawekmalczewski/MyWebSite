class PostsController < ApplicationController

  layout "application"
  layout "admin", :only => "admin_post_index"

  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :delete, :confirm_deletion]}, site_admin: :all, editor: :all

  def index
    @post = Post.where(:Post_Visibility => true).paginate(:page => params[:page], :per_page => 6).order('created_at DESC')
    @category = PostCategory.all
  end

  def admin_post_index
    @post = Post.paginate(:page => params[:page], :per_page => 4)
    @comments = Comment.all
  end

  def new
    @post_category = PostCategory.all
  end

  def create
    @post = Post.new(required_parameters)
    @user = User.all
    if @post.save
      flash[:alert] = "Post sucessfully created"
      redirect_to(:controller => "administrators", :action => 'index')
      # send email whenever new post is published
      UserMailer.new_post_published(@post).deliver
      # after creating post redirect to index site
    else
      flash[:alert] = "Problem with saving your post"
      render('new')
    end
  end

  def edit
    @post = Post.find(params[:id])
    @post_category = PostCategory.all
    @user = User.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(required_parameters)
      flash[:alert] = "Post sucessfully updated"
      redirect_to(:action => 'show', :id => @post.id)
    else
      flash[:alert] = "Problem with saving your changes"
      render('edit')
    end
  end

  def show
    @post = Post.find(params[:id])

    render layout: 'application'
  end

  def delete
    @post = Post.find(params[:id])
  end

  def confirm_deletion
    post = Post.find(params[:id]).destroy
    flash[:alert] = "Post sucessfully deleted"
    redirect_to(:controller => 'posts', :action => 'admin_post_index')
  end

private

  def required_parameters
    params.require(:post).permit(:Post_Title, :Post_Author, :Post_Body, :Post_Visibility, :post_category_id, :postHeaderPhoto, uploads: [])
  end

end
