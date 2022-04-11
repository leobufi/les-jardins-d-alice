class CreateFormations < ActiveRecord::Migration[6.1]
  def change
    create_table :formations do |t|
      t.string :title
      t.text :description
      t.string :dates

      t.timestamps
    end
  end
end
