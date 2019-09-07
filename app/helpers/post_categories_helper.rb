module PostCategoriesHelper

  def number_of_post_with_category(cat)
    Post.where('post_category_id == ?',cat).count
  end

end
