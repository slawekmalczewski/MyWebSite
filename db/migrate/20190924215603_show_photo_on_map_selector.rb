class ShowPhotoOnMapSelector < ActiveRecord::Migration[5.2]
  def change
    add_column :my_photos, :show_on_map, :boolean, :default => false
  end
end
