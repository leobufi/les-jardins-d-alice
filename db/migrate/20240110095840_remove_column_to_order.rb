class RemoveColumnToOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :line_item_ids
  end
end
