class AddUserToJardin < ActiveRecord::Migration[6.1]
  def change
    add_reference :jardins, :user
  end
end
