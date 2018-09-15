class UsersController < ApplicationController

  layout "admin"

  before_action :check_login, :except => [:login, :loginProcess, :logout]


  def index
    @user = User.paginate(:page => params[:page], :per_page => 4)
  end

  def new
  end

  def show
  end

  def edit
  end

  def delete
  end
end
