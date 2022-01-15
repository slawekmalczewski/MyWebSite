class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :artworks, :artworkGalleryId, :artwork_gallery_id
  end
end
