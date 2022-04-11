class CreateJardins < ActiveRecord::Migration[6.1]
  def change
    create_table :jardins do |t|
      t.string :title
      t.text :description
      t.string :photos_url
      t.string :main_photo

      t.timestamps
    end
  end
end
