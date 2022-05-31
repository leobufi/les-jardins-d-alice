class CreateAboutMes < ActiveRecord::Migration[6.1]
  def change
    create_table :about_mes do |t|
      t.text :description
      t.string :main_photo
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
