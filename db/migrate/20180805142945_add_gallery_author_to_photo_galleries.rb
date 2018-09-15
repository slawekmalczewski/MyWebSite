class AddGalleryAuthorToPhotoGalleries < ActiveRecord::Migration[5.2]
  def change
    add_column :photo_galleries, :galleryAuthor, :string
  end
end
