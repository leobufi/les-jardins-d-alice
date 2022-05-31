class AddColumnToAboutMe < ActiveRecord::Migration[6.1]
  def change
    add_column :about_mes, :about, :boolean, null: false, default: false
  end
end
