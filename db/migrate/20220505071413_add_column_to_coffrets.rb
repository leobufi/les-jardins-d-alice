class AddColumnToCoffrets < ActiveRecord::Migration[6.1]
  def change
    add_column :coffrets, :main_photo, :string
    add_column :formations, :main_photo, :string
    add_column :formations, :photos_url, :string
  end
end
