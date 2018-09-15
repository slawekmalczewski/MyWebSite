class ApplicationController < ActionController::Base


private

  def check_login
    unless session[:user_id]
      redirect_to(:controller => 'administrators', :action=>'login')
      return false
    else
      return true
    end
  end

end
