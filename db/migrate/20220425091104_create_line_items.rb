class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.integer :quantity, default: 1
      t.references :product, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.references :coffret, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
