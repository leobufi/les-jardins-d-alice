class AddColumnToOrder2 < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :check, :boolean, null: false, default: false
  end
end
