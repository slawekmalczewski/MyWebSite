class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.string :skillName
      t.integer :skillKnowledge

      t.timestamps
    end
  end
end
