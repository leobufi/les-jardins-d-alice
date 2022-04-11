class CreateRayons < ActiveRecord::Migration[6.1]
  def change
    create_table :rayons do |t|
      t.string :title
      t.text :selling_points

      t.timestamps
    end
  end
end
