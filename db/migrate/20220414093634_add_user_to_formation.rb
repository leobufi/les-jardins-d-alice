class AddUserToFormation < ActiveRecord::Migration[6.1]
  def change
    add_reference :formations, :user
  end
end
