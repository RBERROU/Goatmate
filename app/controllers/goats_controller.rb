class GoatsController < ApplicationController
  before_action :set_goat, only: [:show, :destroy]

  def show
    @booking = @goat.build_booking
  end

  def new
    @goat = Goat.new
  end

  def create
    @goat = Goat.new(goat_params)
    @goat.user = current_user

    if @goat.save
      redirect_to root_path, notice: 'Goat was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @goat.destroy
    redirect_to dashboard_path, notice: 'Goat was successfully deleted.'
  end

  private

  def set_goat
    @goat = Goat.find(params[:id])
  end

  def goat_params
    params.require(:goat).permit(:name, :price_per_day, :bio, :image)
  end
end
