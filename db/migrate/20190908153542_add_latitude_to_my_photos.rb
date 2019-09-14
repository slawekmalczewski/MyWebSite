class AddLatitudeToMyPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :my_photos, :latitude, :float
  end
end
