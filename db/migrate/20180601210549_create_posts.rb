class CreatePosts < ActiveRecord::Migration[5.2]
  def up
    create_table :posts do |t|
      t.integer "post_category_id"
      t.string "Post_Title"
      t.string "Post_Author"
      t.text "Post_Body"
      t.boolean "Post_Visibility", :default => true
      t.timestamps
    end
  end

  def down
    drop_table :posts
  end

end
