class AddUserToCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :categories, :user
  end
end
