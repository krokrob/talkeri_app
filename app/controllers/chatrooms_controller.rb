class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])

    @message = Message.new

    @chatroom_users = @chatroom.users

    @messages = @chatroom.messages

    @current_user_chatrooms = current_user.chatrooms

    @alert = Alert.new

    @active_alert = @chatroom.alerts.where(status: false)
  end

end
