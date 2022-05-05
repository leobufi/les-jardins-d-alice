class AddColumnToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :main_photo, :string
  end
end
