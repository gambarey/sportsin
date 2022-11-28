class OffersController < ApplicationController
  def new
    @offer = Offer.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @offer = offer.new(offer_params)
    @offer.user = @user
    @offer.user = current_user
    @offer.status = false
    if @offer.save
      redirect_to offers_path, notice: 'offer was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @offer = Offer.all
  end

  def index
    @offer = Offer.all
  end

  def destroy
    @offer.destroy

    redirect_to bookings_path, notice: 'booking was successfully destroyed'
  end
end
