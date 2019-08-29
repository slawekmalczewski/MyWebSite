module ApplicationHelper

  def login_helper
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path) +
      "<br>".html_safe +
      (link_to "Login", new_user_session_path)
    else
      link_to "Logout", destroy_user_session_path, method: :delete
    end
  end

  def iconStatus(boolean, options={})
    options[:true_text] ||= ''
    options[:false_text] ||= ''
    if boolean
      content_tag(:span, options[:true_text], :class => "fa fa-check" )
    else
      content_tag(:span, options[:true_text], :class => "fa fa-times-circle" )
    end
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def copyright_generator (name,msg)
    "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
  end

end
