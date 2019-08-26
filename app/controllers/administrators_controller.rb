class AdministratorsController < ApplicationController

  layout "admin"

  before_action :check_login, :except => [:login, :loginProcess, :logout]

  def index
    @post = Post.all
    @newestPost = Post.recent
    @gallery = PhotoGallery.all
    @photographs = MyPhoto.all
    @categories = PostCategory.all
    @user = User.all
  end

  def loginProcess
    if params[:Username].present? && params[:password].present?
      admin_lookup = User.where(:Username => params[:Username]).first
      if admin_lookup
        admin_authorization = admin_lookup.authenticate(params[:password])
      end
    end

    if admin_authorization
      session[:user_id] = admin_authorization.id
      session[:Username] = admin_authorization.Username
      admin_name = User.where(:Username => session[:Username]).first.User_FirstName
      flash[:alert] = "Welcome back " + admin_name
      redirect_to(:action=>'index')
    else
      flash[:alert] = "Wrong Username or Password"
      redirect_to(:action=>'login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:user] = nil
    flash[:alert] = "You have been succesfully logged out"
    redirect_to(:controller=>'administrators', :action=>'login')
  end

end
