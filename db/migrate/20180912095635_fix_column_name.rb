class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :post_categories, :PostCategory_Name, :postcategoryname
  end
end
