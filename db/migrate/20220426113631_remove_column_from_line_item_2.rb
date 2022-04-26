class RemoveColumnFromLineItem2 < ActiveRecord::Migration[6.1]
  def change
    remove_column :line_items, :order_id
    add_reference :line_items, :order, null: true
  end
end
