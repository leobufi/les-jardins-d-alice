class AddColumnToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :main_photo, :string
  end
end
