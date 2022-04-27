class AddForeignKeysToLineItem < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :line_items, :products
    add_foreign_key :line_items, :coffrets
    add_foreign_key :line_items, :orders
  end
end
