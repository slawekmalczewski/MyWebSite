module ApplicationHelper

  def login_helper
    if current_user.is_a?(GuestUser)
      "<li class = 'd-flex nav-link nav-link-auth align-items-baseline'>".html_safe +
      (link_to "Register", new_user_registration_path) +
      "</li>".html_safe +
      "<li class = 'd-flex nav-link nav-link-auth align-items-baseline'>".html_safe + (link_to "Login", new_user_session_path) +
      "</li>".html_safe
    else
      "<li class = 'd-flex nav-link nav-link-auth align-items-baseline'>".html_safe +
      (link_to "Admin Panel", controller: 'administrators', action: 'index') +
      "</li>".html_safe +
      "<li class = 'd-flex nav-link nav-link-auth align-items-baseline'>".html_safe +
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

end
