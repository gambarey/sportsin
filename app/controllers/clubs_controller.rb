class ClubsController < ApplicationController
  before_action :set_club, only: %i[show destroy edit update]

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    if @club.save
      redirect_to @club, notice: 'Club successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: "Club was successfully updated." }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @club.destroy

    redirect_to root_path, notice: 'Club was successfully destroyed'
  end

  def index
    @clubs = current_user.clubs
  end

  private

  def set_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.require(:club).permit(:name, :sport_id, :user_id, :website)
  end
end
