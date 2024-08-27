class PagesController < ApplicationController
  def home
    @goats = Goat.all # Fetch all goats from the database
  end
end
