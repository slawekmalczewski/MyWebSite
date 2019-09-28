module PostCategoriesHelper

  def number_of_post_with_category(cat)
    t = Post.all.where('post_category_id == ?',cat).count
    return t
  end

end
