class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])

    @message = Message.new

    @chatroom_users = @chatroom.users

    @messages = @chatroom.messages

    @current_user_chatrooms = current_user.chatrooms

#Creating a new alert
    @alert = Alert.new

#As a user, I can mark an active alert as solved
    @active_alert = @chatroom.alerts.where(status: false)
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    @user_chatroom = UserChatroom.new(chatroom_params)
    # @message.chatroom = @
    # @message.user = current_user
    # if @message.save
    #   redirect_to chatroom_path(@chatroom)
    # else
    #   render :new
    # end
  end

  def one_on_one_chatroom

  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:user)
  end

end
