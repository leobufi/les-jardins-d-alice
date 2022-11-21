class AddColumnToOrder3 < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :card, :boolean, null: false, default: false
  end
end
