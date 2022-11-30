class OffersController < ApplicationController
  before_action :set_offer, only: %i[show destroy]
  def new
    @offer = Offer.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @offer = Offer.new(offer_params)
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
    @offers = Offer.all
  end

  def index
    # @offers = Offer.all
      # [...]
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "movies/list", locals: { movies: @movies }, formats: [:html] }
    end
  end

  def destroy
    @offer.destroy

    redirect_to offers_path, notice: 'offer was successfully destroyed'
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:title, :location, :fee, :description, :user_id)
  end
end
