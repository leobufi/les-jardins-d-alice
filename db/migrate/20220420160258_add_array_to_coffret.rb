class AddArrayToCoffret < ActiveRecord::Migration[6.1]
  def change
    add_column :coffrets, :product_ids, :integer, array: true, default: []
  end
end
