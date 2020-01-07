module PhotoGalleriesHelper

  def sort_gallery_by_photo_position(gallery)
    gallery.sort_by { |a| a.myPhotoPosition }
  end

end
