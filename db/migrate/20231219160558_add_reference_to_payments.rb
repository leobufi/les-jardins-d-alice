class AddReferenceToPayments < ActiveRecord::Migration[7.0]
  def change
    add_reference :payments, :orders, index: true
  end
end
