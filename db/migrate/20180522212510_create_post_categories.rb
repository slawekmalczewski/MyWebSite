class CreatePostCategories < ActiveRecord::Migration[5.2]
  def up
    create_table :post_categories do |t|
      t.string "PostCategory_Name"
      t.text "PostCategory_Description"
      t.timestamps
    end
  end

  def down
    drop_table :post_categories
  end

end
