class AddLongitudeToMyPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :my_photos, :longitude, :float
  end
end
