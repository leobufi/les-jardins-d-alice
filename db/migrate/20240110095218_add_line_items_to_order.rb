class AddLineItemsToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :line_item_ids, :string
  end
end
