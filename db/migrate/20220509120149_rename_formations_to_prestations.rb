class RenameFormationsToPrestations < ActiveRecord::Migration[6.1]
  def self.up
    rename_table :formations, :prestations
  end

  def self.down
    rename_table :prestations, :formations
  end
end
