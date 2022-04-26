class RemoveColumnFromLineItem3 < ActiveRecord::Migration[6.1]
  def change
    remove_column :line_items, :cart_id
    add_reference :line_items, :cart, null: true
  end
end
