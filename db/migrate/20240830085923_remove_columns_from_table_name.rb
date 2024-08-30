class RemoveColumnsFromTableName < ActiveRecord::Migration[7.1]
  def change
    remove_column :goats, :default, :string
    remove_column :goats, :false, :string
  end
end
