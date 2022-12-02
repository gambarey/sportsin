class MessagesController < ApplicationController
  before_action :set_message, only: %i[show destroy]
  def new
    @message = Message.new
    @user = User.find(params[:user_id])
    @club = Club.find(params[:club_id])
  end

  def create
    @user = User.find(params[:user_id])
    @message = Message.new(message_params)
    # @message.user = @user
    @message.user = current_user

    if @message.save
      redirect_to messages_path, notice: 'message was successfully sent'
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

    redirect_to messages_path, notice: 'message was successfully deleted'
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:club_id, :content, :user_id)
  end
end
