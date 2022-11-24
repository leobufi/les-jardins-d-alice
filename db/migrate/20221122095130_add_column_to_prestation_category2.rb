class AddColumnToPrestationCategory2 < ActiveRecord::Migration[6.1]
  def change
    add_column :prestation_categories, :photos, :string
  end
end
