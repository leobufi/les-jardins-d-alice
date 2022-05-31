class AddColumnToPrestationCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :prestation_categories, :description, :text
  end
end
