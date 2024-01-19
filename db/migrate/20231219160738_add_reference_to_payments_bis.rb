class AddReferenceToPaymentsBis < ActiveRecord::Migration[7.0]
  def change
    remove_column :payments, :orders_id
    add_reference :payments, :order_id
  end
end
