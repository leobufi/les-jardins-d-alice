class RemoveColumnToLineItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :line_items, :product_id
    add_reference :line_items, :product, null: true
  end
end
