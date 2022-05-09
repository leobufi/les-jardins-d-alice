class AddTitleToPrestations < ActiveRecord::Migration[6.1]
  def change
    add_column :prestation_categories, :title, :string
  end
end
