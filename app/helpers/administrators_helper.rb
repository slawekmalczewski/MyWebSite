module AdministratorsHelper

  def latest_draft
    if Post.where(Post_Visibility: false).exists?
      latest_post_draft = Post.where(Post_Visibility: false).order('created_at DESC').first
      draft_id = latest_post_draft.id
      sanitize(latest_post_draft.Post_Body.truncate(500))
    else
      "<h3>All posts have been published !!!</h3>".html_safe
    end
  end

  def latest_draft_updated_at
    if Post.where(Post_Visibility: false).exists?
      latest_post_draft = Post.where(Post_Visibility: false).order('created_at DESC').first
      latest_post_update_date = latest_post_draft.updated_at
    end
  end

  def latest_draft_link_button
    if Post.where(Post_Visibility: false).exists?
      latest_post_draft = Post.where(Post_Visibility: false).order('created_at DESC').first
      draft_id = latest_post_draft.id
      link_to("Continue Work", {:controller => 'posts', :action => 'edit', :id => "#{draft_id}"}, class: "btn btn-warning btn-sm")
    end
  end


# Post data functions
  def number_of_posts
    Post.count
  end

  def number_of_published_posts
    if Post.first.present?
      Post.where(Post_Visibility: true).count
    end
  end

  def number_of_unpublished_posts
    if Post.first.present?
      Post.where(Post_Visibility: false).count
    end
  end

  def most_recent_post_title
    if Post.first.present?
      Post.order('created_at DESC').first.Post_Title
    end
  end

  def most_recent_post_date
    if Post.first.present?
      Post.order('created_at DESC').first.created_at
    end
  end

  def latest_post_link_button
    if Post.first.present?
      latest_post = Post.order('created_at DESC').first
      post_id = latest_post.id
    end
  end

# Gallery data functions
  def number_of_galleries
    PhotoGallery.count
  end

  def number_of_published_galleries
    if PhotoGallery.first.present?
      PhotoGallery.where(galleryVisibility: true).count
    end
  end

  def number_of_unpublished_galleries
    if PhotoGallery.first.present?
      PhotoGallery.where(galleryVisibility: false).count
    end
  end

  def most_recent_gallery_title
    if PhotoGallery.first.present?
      PhotoGallery.order('created_at DESC').first.gallerytitle
    end
  end

  def most_recent_gallery_date
    if PhotoGallery.first.present?
      PhotoGallery.order('created_at DESC').first.created_at
    end
  end

  def latest_gallery_link_button
    if PhotoGallery.first.present?
      latest_gallery = PhotoGallery.order('created_at DESC').first
      gallery_id = latest_gallery.id
    end
  end

# Photo data functions

  def number_of_photographs
    MyPhoto.count
  end

  def number_of_published_photographs
    if MyPhoto.first.present?
      MyPhoto.where(myPhotoVisibility: true).count
    end
  end

  def number_of_unpublished_photographs
    if MyPhoto.first.present?
      MyPhoto.where(myPhotoVisibility: false).count
    end
  end

  def most_recent_photograph_title
    if MyPhoto.first.present?
      MyPhoto.order('created_at DESC').first.myPhotoTitle
    end
  end

  def most_recent_photograph_date
    if MyPhoto.first.present?
      MyPhoto.order('created_at DESC').first.created_at
    end
  end

  def latest_photo_link_button
    if MyPhoto.first.present?
      latest_photo = MyPhoto.order('created_at DESC').first
      photo_id = latest_photo.id
    end
  end

end
