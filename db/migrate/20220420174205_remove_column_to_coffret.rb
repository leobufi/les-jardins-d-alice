class RemoveColumnToCoffret < ActiveRecord::Migration[6.1]
  def change
    remove_column :coffrets, :product_ids
    add_column :coffrets, :coffret_products, :text
  end
end
