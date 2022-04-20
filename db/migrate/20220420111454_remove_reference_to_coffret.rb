class RemoveReferenceToCoffret < ActiveRecord::Migration[6.1]
  def change
    remove_column :coffrets, :products_id
  end
end
