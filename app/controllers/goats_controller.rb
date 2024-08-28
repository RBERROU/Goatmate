class GoatsController < ApplicationController
  def show
    @goat = Goat.find(params[:id])
    @booking = @goat.build_booking
  end
end
