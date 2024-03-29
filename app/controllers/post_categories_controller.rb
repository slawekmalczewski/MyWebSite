class PostCategoriesController < ApplicationController
# Categories should be only accessible to administrators
  layout "admin"

  access all: [], user: {except: [:destroy, :new, :create, :update, :edit, :delete, :confirm_deletion]}, site_admin: :all

  def index
    @post_category = PostCategory.all
    @post = Post.all
  end

  def show
    @post_category = PostCategory.find(params[:id])
  end

  def new
  end

  def create
    @post_category = PostCategory.new(required_parameters)
    if @post_category.save
      flash[:alert] = "Post Category sucessfully created"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def update
    @post_category = PostCategory.find(params[:id])
    if @post_category.update(required_parameters)
      flash[:alert] = "Post Category sucessfully updated"
      redirect_to(:action => 'show', :id => @post_category.id)
    else
      render('edit')
    end
  end


  def edit
    @post_category = PostCategory.find(params[:id])
  end

  def delete
    @post_category = PostCategory.find(params[:id])
  end

  def confirm_deletion
    if post_category = PostCategory.find(params[:id]).destroy
      flash[:alert] = "Post Category sucessfully deleted"
      redirect_to(:action => 'index')
    else
      flash[:alert] = "Post Category could NOT be deleted as there are elements depending on it !!!"
      redirect_to(:action => 'index')
    end
  end


  def required_parameters
    params.require(:post_category).permit(:postcategoryname, :PostCategory_Description, :colour)
  end

end
