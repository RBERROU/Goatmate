class GoatsController < ApplicationController

  before_action :set_goat, only: [:show]

  def show
    @goat = Goat.find(params[:id])
    @booking = @goat.build_booking
  end

  def new
    @goat = Goat.new
  end

  def create
    @goat = Goat.new(goat_params)
    @goat.user = current_user # Assuming you have user authentication and each goat belongs to a user

    if @goat.save
      redirect_to root_path, notice: 'Goat was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def random
    random_goat = Goat.order("RANDOM()").first
    if random_goat
      redirect_to goat_path(random_goat)
    else
      redirect_to root_path, alert: 'No goats available.'
    end
  end

  private

  def set_goat
    @goat = Goat.find(params[:id])
  end

  def goat_params
    params.require(:goat).permit(:name, :price_per_day, :bio, :image)
  end
end
