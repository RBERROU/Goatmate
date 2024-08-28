class AddCheckInAndCheckOutToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :rent_start, :date
    add_column :bookings, :rent_end, :date
  end
end
