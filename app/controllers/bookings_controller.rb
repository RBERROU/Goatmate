class BookingsController < ApplicationController
  before_action :set_goat, only: [:new, :create]
  before_action :set_booking, only: [:approve, :reject]

  def new
    if @goat.booking
      redirect_to root_path, alert: 'This goat is already booked.'
    else
      @booking = @goat.build_booking
    end
  end

  def create
    if user_signed_in?
      if @goat.booking
        redirect_to root_path, alert: 'This goat is already booked.'
      else
        @booking = @goat.build_booking(booking_params)
        @booking.status = "pending"
        @booking.user = current_user

        # Calculate total price based on rent_start and rent_end
        if @booking.rent_start.present? && @booking.rent_end.present?
          days = (@booking.rent_end - @booking.rent_start).to_i
          @booking.total_price = days * @goat.price_per_day
        end

        if @booking.save
          redirect_to root_path, notice: 'Booking was successfully created.'
        else
          render :new
        end
      end
    else
      # The user is not logged in
      redirect_to new_user_registration_path
    end
  end

  def approve
    if @booking.update(status: 'approved')
      redirect_to dashboard_path, notice: 'Booking approved.'
    else
      redirect_to dashboard_path, alert: 'Could not approve the booking.'
    end
  end

  def reject
    if @booking.update(status: 'rejected')
      redirect_to dashboard_path, notice: 'Booking rejected.'
    else
      redirect_to dashboard_path, alert: 'Could not reject the booking.'
    end
  end

  private

  def set_goat
    @goat = Goat.find(params[:goat_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:rent_start, :rent_end)
  end
end
