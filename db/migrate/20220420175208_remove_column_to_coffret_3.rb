class RemoveColumnToCoffret3 < ActiveRecord::Migration[6.1]
  def change
    remove_column :coffrets, :coffret_products
    add_column :coffrets, :coffret_products, :string
  end
end
