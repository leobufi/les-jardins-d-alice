class AddForeignKeyToPrestation < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :prestations, :prestation_categories
  end
end
