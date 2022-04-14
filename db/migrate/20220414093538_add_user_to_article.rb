class AddUserToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :photos_url, :string
    add_reference :articles, :user
  end
end
