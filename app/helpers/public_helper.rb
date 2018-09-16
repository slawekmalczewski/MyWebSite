module PublicHelper

  def article_preview(toTruncate)
    textTruncated = truncate(toTruncate, :length => 200, :omission => "[...]", :escape => false)
    strip_tags(textTruncated)
  end

  def first_sentence(toTruncate)
    sentence = toTruncate.split(".").first + "."
    strip_tags(sentence)
  end

end
