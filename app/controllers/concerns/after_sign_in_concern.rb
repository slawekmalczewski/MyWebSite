module AfterSignInConcern
  extend ActiveSupport::Concern

  def after_sign_in_path_for(resource)
    if resource.has_roles?(:site_admin)
      "/administrators/index"
    elsif resource.has_roles?(:editor)
      "/administrators/index"
    else
      "/administrators/user_index"
    end
  end

end
