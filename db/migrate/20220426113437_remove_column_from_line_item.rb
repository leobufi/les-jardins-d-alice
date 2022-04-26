class RemoveColumnFromLineItem < ActiveRecord::Migration[6.1]
  def change
    remove_column :line_items, :coffret_id
    add_reference :line_items, :coffret, null: true
  end
end
