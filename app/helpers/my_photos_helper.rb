module MyPhotosHelper

  def displayThumbnail(photo)
    if photo.present?
      image_tag(photo, :size => "100x50", :crop => :fill)
    end
  end



end
