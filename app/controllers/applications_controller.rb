class ApplicationsController < ApplicationController
  before_action :set_offer, only: %i[new create]
  def new
    @application = Application.new
  end

  def index
    @applications = Application.all
  end

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
  end

  private

  def set_offer
  @offer = Offer.find(params[:offer_id])
  end

end
