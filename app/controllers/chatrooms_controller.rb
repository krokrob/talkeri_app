class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])

    @message = Message.new

    @chatroom_users = @chatroom.users

    @messages = @chatroom.messages

    @current_user_chatrooms = current_user.chatrooms

    @alert = Alert.new

    @alert_solver = AlertSolver.new

#As a user, I can mark an active alert as solved
    @active_alert = @chatroom.alerts.find_by(status: false)
  end

end
