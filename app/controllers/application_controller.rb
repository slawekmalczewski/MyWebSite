class ApplicationController < ActionController::Base

  layout "application"

  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :delete, :confirm_deletion]}, site_admin: :all

  def after_sign_in_path_for(resource)
    "/administrators/index"
  end

private


end
