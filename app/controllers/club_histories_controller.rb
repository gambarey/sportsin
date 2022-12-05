class ClubHistoriesController < ApplicationController
  before_action :set_club_history, only: %i[show destroy edit update]

  def new
    @club_history = ClubHistory.new
  end

  def create
    @club_history = ClubHistory.new(club_history_params)
    if @club_history.save
      redirect_to clubs_path, notice: 'Club History successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_club_history
    @club_history = ClubHistory.find(params[:id])
  end

  def club_history_params
    params.require(:club_history).permit(:user_id, :club_id, :start_date, :end_date, :jersey_number)
  end
end
