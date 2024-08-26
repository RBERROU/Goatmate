class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :status
      t.decimal :total_price
      t.references :goat, null: false, foreign_key: true
      t.timestamps
    end
  end
end
