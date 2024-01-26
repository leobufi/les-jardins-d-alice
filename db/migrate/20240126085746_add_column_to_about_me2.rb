class AddColumnToAboutMe2 < ActiveRecord::Migration[7.0]
  def change
    add_column :about_mes, :selling_points, :string
  end
end
