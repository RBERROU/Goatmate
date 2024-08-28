class PagesController < ApplicationController
  before_action :authenticate_user!, only: :dashboard

  def home
    @goats = Goat.all # Fetch all goats from the database
  end

  def dashboard
    @bookings = current_user.bookings.includes(:goat)
  end
end
