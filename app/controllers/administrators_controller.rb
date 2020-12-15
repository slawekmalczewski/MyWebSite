class AdministratorsController < ApplicationController

  layout "admin"

  access all: [], user: {except: [:destroy, :new, :create, :update, :edit, :index]}, site_admin: :all, editor: :all

  def index
    @post = Post.all
    @newestPost = Post.first
    @gallery = PhotoGallery.all
    @photographs = MyPhoto.all
    @categories = PostCategory.all
    @user = User.all
  end

  def user_index
    render layout: 'application'
    @user = User.all
  end

  def welcome
    render layout: 'application'
    @user = User.all
  end

  def subscription_on_off
    # render layout: 'application'
    @user = current_user
    @user.update(:subscription => !@user.subscription)
    redirect_to request.referrer
    flash[:alert] = "Subscription status has been changed"
  end

end
