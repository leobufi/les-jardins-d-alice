class RemoveColumnToCoffretOnDemand < ActiveRecord::Migration[6.1]
  def change
    remove_column :coffret_on_demands, :user_id
  end
end
