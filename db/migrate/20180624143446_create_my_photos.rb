class CreateMyPhotos < ActiveRecord::Migration[5.2]
  def up
    create_table :my_photos do |t|
      t.integer "photo_gallery_id"
      t.boolean "myPhotoVisibility", :default => true
      t.integer "myPhotoPosition"
      t.string "myPhotoTitle"
      t.text "myPhotoDescription"
      t.text "myPhotoLocation"
      t.string "myPhotoISO"
      t.string "myPhotoAperture"
      t.string "myPhotoShutterSpeed"
      t.timestamps
    end
  end

  def down
    drop_tables :my_photos
  end

end
