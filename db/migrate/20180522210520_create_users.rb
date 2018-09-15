class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string "User_FirstName", :limit => 20
      t.string "User_Surname", :limit => 40
      t.string "Username", :limit => 25
      t.string "Email", :limit => 60, :default => "", :null => false
      t.string "password_digest"
      t.timestamps
    end
    add_index("users", "Username")
  end

  def down
    drop_table :users
  end

end
