class AddColumnsToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :state, :string
    add_column :orders, :amount_cents, :integer, default: 0, null: false
    add_column :orders, :checkout_session_id, :string
  end
end
