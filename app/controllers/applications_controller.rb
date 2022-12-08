class ApplicationsController < ApplicationController
  before_action :set_offer, only: %i[new create]
  def new
    @application = Application.new
  end

  def index
    @my_applications = current_user.applications
    @my_club_applications = current_user.my_club_applications
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
    @application = Application.find(params[:id])
    parameters = application_params
    parameters[:status] = parameters[:status].to_i
    @application.update(parameters)
  end

  private

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def application_params
    params.require(:application).permit(:offer_id, :user_id, :status)
  end
end
