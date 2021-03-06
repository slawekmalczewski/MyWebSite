module ApplicationHelper

  def login_helper
    if current_user.is_a?(GuestUser)
      "<li class='menu-link'>".html_safe +
      (link_to "Register", new_user_registration_path) +
      "</li>".html_safe +
      "<li class='menu-link'>".html_safe + (link_to "Login", new_user_session_path) +
      "</li>".html_safe
    elsif is_admin?
      "<li class='menu-link'>".html_safe +
      (link_to "Admin Panel", controller: 'administrators', action: 'index') +
      "</li>".html_safe +
      "<li class='menu-link'>".html_safe +
      (link_to "Logout", destroy_user_session_path, method: :delete) +
      "</li>".html_safe
    elsif is_registered_user?
      "<li class='menu-link'>".html_safe +
      (link_to "User Panel", controller: 'administrators', action: 'user_index') +
      "</li>".html_safe +
      "<li class='menu-link'>".html_safe +
      (link_to "Logout", destroy_user_session_path, method: :delete) +
      "</li>".html_safe
    end
  end

  def iconStatus(boolean, options={})
    options[:true_text] ||= ''
    options[:false_text] ||= ''
    if boolean
      content_tag(:span, options[:true_text], :class => "fa fa-check fa-lg" )
    else
      content_tag(:span, options[:true_text], :class => "fa fa-ban fa-lg" )
    end
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def copyright_generator (name,msg)
    "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
  end

  def is_admin?
    current_user.has_roles?(:site_admin)
  end

  def is_editor?
    current_user.has_roles?(:editor)
  end

  def is_registered_user?
    current_user.has_roles?(:user)
  end

end
