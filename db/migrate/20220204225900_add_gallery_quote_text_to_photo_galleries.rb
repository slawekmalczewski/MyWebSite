class AddGalleryQuoteTextToPhotoGalleries < ActiveRecord::Migration[6.1]
  def change
    add_column :photo_galleries, :galleryQuoteText, :text
  end
end
