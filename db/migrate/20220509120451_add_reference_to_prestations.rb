class AddReferenceToPrestations < ActiveRecord::Migration[6.1]
  def change
    add_reference :prestations, :prestation_category
  end
end
