class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :quantity
      t.string :origin
      t.string :photos_url
      t.string :main_photo
      t.monetize :price
      t.references :coffret, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
