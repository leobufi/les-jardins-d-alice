class AddColumnToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :data, :boolean, null: false, default: false
  end
end
