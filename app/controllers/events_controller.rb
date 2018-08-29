class EventsController < ApplicationController
  include Pundit
  before_action :authenticate_user!

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
      UserEvent.create(user: current_user, event: @event, responsability: "Organizer")
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

  private

  def event_params
    params.require(:event).permit(:name, :start_date, :end_date)
  end
end
