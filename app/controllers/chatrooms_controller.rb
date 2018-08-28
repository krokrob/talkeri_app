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

  def create
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @chatroom = current_user.chatrooms.joins(:user_chatrooms).where(event: @event, name: nil)
                            .where(user_chatrooms: { user_id: @user.id }).first
    if @chatroom.nil?
      @chatroom = Chatroom.new(event: @event)
      if @chatroom.save
        @user_chatroom1 = UserChatroom.create(user: @user, chatroom: @chatroom)
        @user_chatroom1 = UserChatroom.create(user: current_user, chatroom: @chatroom)
      else
        redirect_to chatroom_path(params[:main_chatroom_id]) and return
      end
    end
    redirect_to chatroom_path(@chatroom)
  end
end
