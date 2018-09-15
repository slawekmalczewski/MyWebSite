module PostsHelper

  def article_preview(toTruncate)
    textTruncated = truncate(toTruncate, :length => 80, :omission => "[...]", :escape => false)
    strip_tags(textTruncated)
  end

end
