class AddUserToCoffret < ActiveRecord::Migration[6.1]
  def change
    add_reference :coffrets, :user
  end
end
