module AfterSignInConcern
  extend ActiveSupport::Concern

  def after_sign_in_path_for(resource)
    "/administrators/index"
  end

end
