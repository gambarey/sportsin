class ApplicationsController < ApplicationController
  before_action :set_offer, only: %i[new create update]
  def new
    @application = Application.new
  end

  def index
    @applications = Application.includes(:offer, :user).all
  end
  # (author: [{reviews: :user}, :nationality], :genre)
  def create
    @application = Application.new
    @application.offer = @offer
    @application.user = current_user
    # @application.status = 0
    if @application.save
      redirect_to applications_path, notice: 'You applied for this offer'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    #need to find the applications throw params
    # @offer.status =
    #
  end

  private

  def set_offer
  @offer = Offer.find(params[:offer_id])
  end

end
