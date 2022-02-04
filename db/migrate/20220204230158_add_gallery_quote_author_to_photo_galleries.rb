class AddGalleryQuoteAuthorToPhotoGalleries < ActiveRecord::Migration[6.1]
  def change
    add_column :photo_galleries, :galleryQuoteAuthor, :string
  end
end
