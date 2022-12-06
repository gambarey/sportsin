class MessagesController < ApplicationController
  before_action :set_message, only: %i[show destroy]

  def new
    @message = Message.new
    # @user = current_user
    # @club = Club.find(params[:id])
  end

  # def create
  #   @user = current_user
  #   @message = Message.new(message_params)
  #   @message.user = @user
  #   # @message.club = @club

  #   if @message.save
  #     redirect_to messages_path, notice: "message was successfully sent"
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def create
    @message = Message.new(message_params)
    @message.club = @club
    @message.user = current_user
    @message.content =
    if @message.save
      redirect_to club_messages_path, notice: 'Message sent'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @messages = Message.all
  end

  def index
    @messages = Message.all
  end

  def destroy
    @message.destroy
    redirect_to messages_path, notice: "message was successfully deleted"
  end

  private

  def set_club
    @club = Club.find(params[:club_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
