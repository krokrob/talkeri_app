class ChatroomsController < ApplicationController
  include Pundit
  before_action :set_event, only: [:new, :create]

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @message = Message.new
    @chatroom_users = @chatroom.users
    @messages = @chatroom.messages.order(created_at: :asc)
    @current_user_chatrooms = current_user.chatrooms
    @alert = Alert.new
    @alert_solver = AlertSolver.new
    @active_alert = @chatroom.alerts.find_by(status: false)
  end

  def create
    if params[:chatroom].present?
      @chatroom = Chatroom.new(chatroom_params)
      @chatroom.event = @event
      authorize @chatroom
      if @chatroom.save
        @chatroom.users << current_user
        params[:users].each do |user|
          UserChatroom.create(user:User.find(user), chatroom: @chatroom)
        end
        redirect_to event_path(@event) and return
      else
        return render :new
      end
    end

    @user = User.find(params[:user_id])
    @chatroom = current_user.chatrooms.where(event: @event, name: nil, id: @user.chatrooms.pluck(:id)).first
    if @chatroom.nil?
      @chatroom = Chatroom.new
      @chatroom.event = @event
      authorize @chatroom
      if @chatroom.save
        @user_chatroom1 = UserChatroom.create(user: @user, chatroom: @chatroom)
        @user_chatroom1 = UserChatroom.create(user: current_user, chatroom: @chatroom)
      else
        redirect_to chatroom_path(params[:main_chatroom_id]) and return
      end
    end
    authorize @chatroom
    redirect_to chatroom_path(@chatroom)
  end

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def edit
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end

  def update
    @chatroom = chatroom.find(params[:id])
    authorize @chatroom
    @chatroom.update(chatroom_params)
    redirect_to event_path(@chatroom.event)
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :instructions)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
