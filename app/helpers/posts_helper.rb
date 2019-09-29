module PostsHelper

  def article_preview(toTruncate)
    textTruncated = truncate(toTruncate, :length => 80, :omission => "[...]", :escape => false)
    strip_tags(textTruncated)
  end

  def find_about_post
    about_project_post = Post.all.where(:Post_Title => 'About')
    about_project_post.first.id
  end

end
