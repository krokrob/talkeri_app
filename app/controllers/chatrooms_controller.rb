class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])

    @message = Message.new

    @chatroom_users = @chatroom.users

    @messages = Message.where(chatroom_id: params[:id])

    @current_user_chatrooms = current_user.chatrooms

    @alert = Alert.new

    @all_alerts = Alert.where(chatroom_id: @chatroom.id)

    @active_alert = @all_alerts.where(status: false)
  end

end
