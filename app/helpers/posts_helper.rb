module PostsHelper

  def post_preview(toTruncate)
    textTruncated = truncate(toTruncate, :length => 180, :omission => "[...]", :escape => false)
    strip_tags(textTruncated)
  end

  def post_title_short(titleToTruncate)
    post_title_truncated = truncate(titleToTruncate, :length => 30, :omission => "[...]", :escape => false)
    strip_tags(post_title_truncated)
  end

  def find_about_post
    about_project_post = Post.all.where(:Post_Title => 'About')
    about_project_post.first.id
  end

end
