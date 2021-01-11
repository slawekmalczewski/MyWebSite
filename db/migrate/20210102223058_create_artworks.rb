class CreateArtworks < ActiveRecord::Migration[6.1]
  def change
    create_table :artworks do |t|
      t.string :artworkTitle
      t.text :artworkDescription
      t.integer :artworkGalleryId
      t.date :artworkCreationDate

      t.timestamps
    end
  end
end
