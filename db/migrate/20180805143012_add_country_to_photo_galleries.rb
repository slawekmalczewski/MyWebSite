class AddCountryToPhotoGalleries < ActiveRecord::Migration[5.2]
  def change
    add_column :photo_galleries, :country, :string
  end
end
