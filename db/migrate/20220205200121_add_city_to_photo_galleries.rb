class AddCityToPhotoGalleries < ActiveRecord::Migration[6.1]
  def change
    add_column :photo_galleries, :city, :string
  end
end
