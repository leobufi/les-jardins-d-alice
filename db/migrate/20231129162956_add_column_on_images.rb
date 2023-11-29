class AddColumnOnImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :coffret_on_demand, :boolean, null: false, default: false
    add_column :images, :coffret_on_demand_img, :string
  end
end
