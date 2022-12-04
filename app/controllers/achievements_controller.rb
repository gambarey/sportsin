class AchievementsController < ApplicationController
  before_action :set_achievement, only: %i[show destroy edit update]

  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(achievement_params)
    if @achievement.save
      redirect_to achievements_path, notice: 'achievement successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @achievements = current_user.achievements
  end

  def edit
  end

  def update
    respond_to do |format|
      if @achievement.update(achievement_params)
        format.html { redirect_to achievements_path, notice: "achievement was successfully updated." }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @achievement.destroy

    redirect_to root_path, notice: 'achievement was successfully destroyed'
  end

  private

  def set_achievement
    @achievement = Achievement.find(params[:id])
  end

  def achievement_params
    params.require(:achievement).permit(:name, :description, :user_id)
  end
end
