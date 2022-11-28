class OffersController < ApplicationController
  def new
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
  end

  def index
  end

  def destroy
  end
end
