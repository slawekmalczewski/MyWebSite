class AddMetadataDetailsToMyPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :my_photos, :latitude_reference, :string
    add_column :my_photos, :longitude_reference, :string
    add_column :my_photos, :camera_make, :string
    add_column :my_photos, :camera_model, :string
    add_column :my_photos, :original_date_time, :string
  end
end
