class AddUserToProduct < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :user
  end
end
