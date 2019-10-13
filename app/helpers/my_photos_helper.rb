module MyPhotosHelper

  def displayThumbnail(photo)
    if photo.present?
      image_tag(photo.variant(combine_options: {resize: 'x100', gravity: 'center'}).processed)
    end
  end

  def has_gps_data(lat)
    if (lat.is_a? Numeric)
      return false
    else
      return true
    end
  end


end
