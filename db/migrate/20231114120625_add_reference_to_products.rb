class AddReferenceToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :coffret_on_demand, index: true

  end
end
