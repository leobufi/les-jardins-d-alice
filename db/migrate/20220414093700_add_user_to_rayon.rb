class AddUserToRayon < ActiveRecord::Migration[6.1]
  def change
    add_reference :rayons, :user
  end
end
