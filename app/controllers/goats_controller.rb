class GoatsController < ApplicationController
  before_action :set_goat, only: [:show, :destroy]

  def show
    @booking = @goat.build_booking
    @goat_skills = {
      hearding: rand(25..100),
      cuteness: rand(25..100),
      friendly: rand(25..100),
      climbing: rand(25..100)
    }
    @owner = @goat.user
  end

  def new
    @goat = Goat.new
  end

  def create
    @goat = Goat.new(goat_params)
    @goat.user = current_user
    @goat.approved = false

    if @goat.save
      redirect_to dashboard_path, notice: 'Your goat has been submitted for approval.'
      # You could also trigger an email or notification to the owner here
    else
      render :new, status: :unprocessable_entity
    end
  end

  def approve
    @goat = Goat.find(params[:id])
    if @goat.update(approved: true)
      redirect_to dashboard_path, notice: 'Goat approved successfully.'
    else
      redirect_to dashboard_path, alert: 'There was a problem approving the goat.'
    end
  end

  def destroy
    @goat.destroy
    redirect_to dashboard_path, notice: 'Goat was successfully deleted.'
  end

  def random
    @goat = Goat.order('RANDOM()').first
    if @goat
      redirect_to goat_path(@goat) # Redirect to the goat's show page
    else
      redirect_to root_path, alert: "No goats available."
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
