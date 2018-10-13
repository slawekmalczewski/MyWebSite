module MyPhotosHelper

  def displayThumbnail(photo)
    if photo.present?
      image_tag(photo.variant(combine_options: {resize: 'x100', gravity: 'center'}).processed)
    end
  end



end
