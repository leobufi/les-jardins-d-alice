class AddColumnToCoffretOnDemand < ActiveRecord::Migration[6.1]
  def change
    add_column :coffret_on_demands, :price_cents, :integer
    add_column :coffret_on_demands, :price_currency, :string, default: "EUR", null: false
    add_column :coffret_on_demands, :user_id, :bigint
    add_column :coffret_on_demands, :products, :string
  end
end
