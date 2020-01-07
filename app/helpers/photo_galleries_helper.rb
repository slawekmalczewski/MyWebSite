module PhotoGalleriesHelper

  def sort_gallery_by_photo_position(gallery)
    gallery.sort_by { |a| a.myPhotoPosition }
  end

  def sort_gallery_by_gallery_position(gallery)
    gallery.order('galleryPosition ASC')
  end
end
