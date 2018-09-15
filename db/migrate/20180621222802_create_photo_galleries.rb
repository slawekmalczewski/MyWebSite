class CreatePhotoGalleries < ActiveRecord::Migration[5.2]
  def up
    create_table :photo_galleries do |t|
      t.string "gallerytitle"
      t.text "galleryDescription"
      t.integer "galleryPosition"
      t.boolean "galleryVisibility", :default => false
      t.timestamps
    end
  end

  def down
    drop_tables :photo_galleries
  end

end
