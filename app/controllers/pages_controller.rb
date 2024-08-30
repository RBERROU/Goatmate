class PagesController < ApplicationController
  before_action :authenticate_user!, only: :dashboard

  def home
    @goats = Goat.all # Fetch all goats from the database
  end

  def dashboard
    @bookings = current_user.bookings.includes(:goat)
    @goats = current_user.goats
    @pending_bookings = Booking.pending_approval.joins(:goat).where(goats: { user_id: current_user.id })
  end
end
