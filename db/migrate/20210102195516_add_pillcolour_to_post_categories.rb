class AddPillcolourToPostCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :post_categories, :colour, :string
  end
end
