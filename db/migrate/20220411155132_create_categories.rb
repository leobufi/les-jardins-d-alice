class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.references :rayon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
