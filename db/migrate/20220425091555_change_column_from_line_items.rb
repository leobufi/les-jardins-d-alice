class ChangeColumnFromLineItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :line_items, :quantity
    add_column :line_items, :quantity, :integer, default: 1
  end
end
