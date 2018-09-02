class EventsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: [:index, :users_chatroom]

  def index
    skip_policy_scope
    @events = current_user.events.order(created_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
    @userevent = UserEvent.new
    @userchatroom = UserChatroom.new
    @users = User.all - @event.users
    @chatroomusers = @event.users
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save
      @user_event1 = UserEvent.create(user: current_user, event: @event, responsability: "Organizer")
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def users_chatroom
    @chatroomusers = @event.users - @chatroom.users
    # redefinir la liste des users en fonction de la chatroom selectionnee qui doit se trouver dans les params
    respond_to do |format|
      format.js # execute toto.js.erb
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_date, :end_date)
  end
end
