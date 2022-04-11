class CreateCoffrets < ActiveRecord::Migration[6.1]
  def change
    create_table :coffrets do |t|
      t.string :title
      t.monetize :price
      t.text :description

      t.timestamps
    end
  end
end
