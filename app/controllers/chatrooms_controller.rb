class ChatroomsController < ApplicationController
  include Pundit

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @message = Message.new
    @chatroom_users = @chatroom.users
    @messages = @chatroom.messages
    @current_user_chatrooms = current_user.chatrooms
    @alert = Alert.new
    @active_alert = @chatroom.alerts.where(status: false)
  end

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    authorize @chatroom
    if @chatroom.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def chatroom_params
    params.require(:event).permit(:name, :instructions)
  end

end
