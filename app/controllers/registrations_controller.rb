class RegistrationsController < Devise::RegistrationsController


  protected

  # def after_sign_up_path_for(resource)
  #   '/public/index'
  # end

  def after_inactive_sign_up_path_for(resource)
    '/public/index'
  end

  def after_sign_up_path_for(resource)
    '/administrators/welcome'
  end

end
