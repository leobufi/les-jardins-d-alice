class AddColumnToCoffret < ActiveRecord::Migration[6.1]
  def change
    add_reference :coffrets, :products
  end
end
