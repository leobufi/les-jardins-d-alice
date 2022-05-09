class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :home_cover
      t.string :jardin_cover
      t.string :prestation_galery
      t.timestamps
    end
  end
end
