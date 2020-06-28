class AddSlugToPhotoGalleries < ActiveRecord::Migration[5.2]
  def change
    add_column :photo_galleries, :slug, :string
    add_index :photo_galleries, :slug, unique: true
  end
end
