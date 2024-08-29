class AddApprovedToGoats < ActiveRecord::Migration[7.1]
  def change
    add_column :goats, :approved, :boolean
    add_column :goats, :default, :string
    add_column :goats, :false, :string
  end
end
