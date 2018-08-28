class ChatroomsController < ApplicationController
  include Pundit
  before_action :set_event, only: [:new, :create]

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @message = Message.new
    @chatroom_users = @chatroom.users
    @messages = @chatroom.messages
    @current_user_chatrooms = current_user.chatrooms
    @alert = Alert.new
    @alert_solver = AlertSolver.new
    @active_alert = @chatroom.alerts.find_by(status: false)
  end

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.event = @event
    authorize @chatroom
    if @chatroom.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :instructions)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
