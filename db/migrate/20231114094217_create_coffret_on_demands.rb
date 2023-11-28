class CreateCoffretOnDemands < ActiveRecord::Migration[6.1]
  def change
    create_table :coffret_on_demands do |t|

      t.timestamps
    end
  end
end
