class CreateArtworkGalleries < ActiveRecord::Migration[6.1]
  def change
    create_table :artwork_galleries do |t|
      t.string :artworkGalleryTitle
      t.text :artworkGalleryDescription
      t.integer :artworkGalleryPosition
      t.boolean :artworkGalleryVisibility

      t.timestamps
    end
  end
end
