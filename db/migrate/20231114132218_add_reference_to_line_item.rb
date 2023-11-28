class AddReferenceToLineItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :line_items, :coffret_on_demand, index: true
  end
end
