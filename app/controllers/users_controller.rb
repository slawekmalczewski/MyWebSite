class UsersController < ApplicationController

  layout "admin"

  access all: [], user: {except: [:destroy, :new, :create, :update, :edit, :confirm_deletion]}, editor: {except: [:delete, :new, :create, :update, :edit, :confirm_deletion]}, site_admin: :all


  def index
    @user = User.paginate(:page => params[:page], :per_page => 4)
  end

  def new
  end

  def create
    @user = User.new(required_parameters)
    if @user.save
      flash[:alert] = "User sucessfully created"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(required_parameters)
      flash[:alert] = "User's details sucessfully updated"
      redirect_to(:action => 'show', :id => @user.id)
    else
      flash[:alert] = "Problem with updating User details !!!"
      render('edit')
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def change_password
    @user = User.find(params[:id])
  end

  def delete
    @user = User.find(params[:id])
  end

  def confirm_deletion
    user = User.find(params[:id]).destroy
    flash[:alert] = "User sucessfully deleted"
    redirect_to(:action => 'index')
  end


  private

    def required_parameters
      params.require(:user).permit(:first_name, :last_name, :email, :roles, :password, :password_confirmation, :subscription)
    end

end
