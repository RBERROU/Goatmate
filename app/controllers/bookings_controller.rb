class BookingsController < ApplicationController
  before_action :set_goat, only: [:new, :create]

  def new
    @booking = @goat.build_booking
  end

  def create
    if user_signed_in?
      # The user is logged in
      @goat = Goat.find(params[:goat_id])
      @booking = @goat.build_booking(booking_params)
      @booking.status = "pending"
      @booking.user = current_user

      if @booking.save!
        redirect_to root_path, notice: 'Booking was successfully created.'
      else
        render :new
      end
    else
      # The user is not logged in
      redirect_to new_user_registration_path
    end
  end

  private

  def set_goat
    @goat = Goat.find(params[:goat_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :total_price)
  end
end
