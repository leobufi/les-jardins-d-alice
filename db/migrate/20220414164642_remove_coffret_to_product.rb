class RemoveCoffretToProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :coffret_id
    add_reference :products, :coffret, null: true
  end
end
