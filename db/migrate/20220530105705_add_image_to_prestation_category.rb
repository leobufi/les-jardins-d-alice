class AddImageToPrestationCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :prestation_categories, :main_photo, :string
  end
end
