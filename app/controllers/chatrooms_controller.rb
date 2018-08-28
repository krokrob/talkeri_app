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

end
