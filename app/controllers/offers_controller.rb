class OffersController < ApplicationController
  before_action :set_offer, only: %i[show destroy]

  def new
    @offer = Offer.new
    @user = current_user
  end

  def create
    @user = current_user
    @offer = Offer.new(offer_params)
    @offer.club = current_user.owned_club
    if @offer.save
      redirect_to offers_path, notice: "offer was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def index
    @offers = Offer.includes(:club).all
    # @current_offer = @offers.first

    if params[:query].present?
      sql_query = <<~SQL
        offers.title @@ :query
        OR offers.description @@ :query
        OR offers.location @@ :query
      SQL
      @offers = Offer.where(sql_query, query: "%#{params[:query]}%")
    else
      @offers = Offer.all
    end
  end

  def destroy
    @offer.destroy

    redirect_to offers_path, notice: "offer was successfully destroyed"
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:title, :location, :fee, :description, :club_id)
  end
end
