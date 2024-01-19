class AddReferenceToPaymentsBis2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :payments, :order_id_id
    add_reference :payments, :order
  end
end
