class AddColumnToImage < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :logos, :boolean, null: false, default: false
    add_column :images, :logos_img, :string
  end
end
