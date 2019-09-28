class ChangeMyPhotosTable < ActiveRecord::Migration[5.2]
  def change
    add_column :my_photos, :address, :text
  end
end
