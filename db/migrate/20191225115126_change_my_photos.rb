class ChangeMyPhotos < ActiveRecord::Migration[5.2]
  def change
    change_column_default :my_photos, :show_on_map,nil
  end
end
