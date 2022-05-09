class CreatePrestationCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :prestation_categories do |t|

      t.timestamps
    end
  end
end
