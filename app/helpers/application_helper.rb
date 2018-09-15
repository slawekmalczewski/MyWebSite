module ApplicationHelper

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

end
