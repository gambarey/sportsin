class OffersController < ApplicationController
  before_action :set_offer, only: %i[show destroy]
  def new
    @offer = Offer.new
    @user = current_user
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
    @offer = Offer.find(params[:id])
  end

  def index
    @offers = Offer.all
    @current_offer = @offers.first

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

    # @marker =
    #   {
    #     lat: @current_offer.geocode[0],
    #     lng: @current_offer.geocode[1]
    #     # info_window: render_to_string(partial: "info_window", locals: {offer: offer})
    #   }

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
