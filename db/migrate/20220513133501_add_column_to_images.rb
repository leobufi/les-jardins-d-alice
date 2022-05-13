class AddColumnToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :home, :boolean, null: false, default: false
    add_column :images, :jardin, :boolean, null: false, default: false
    add_column :images, :prestation, :boolean, null: false, default: false
  end
end
