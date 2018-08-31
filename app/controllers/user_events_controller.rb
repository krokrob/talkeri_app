class UserEventsController < ApplicationController
  def create
    # creer l'event user puis redirect to show de l'event
    @userevent = UserEvent.new(userevent_params)
    @event = Event.find(params[:event_id])
    raise
    # .valid? ~ .errors.messages .save!
    @userevent.event = @event
    authorize @userevent
    if @userevent.save
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end

  private

  def userevent_params
    params.require(:user_event).permit(:user_id, :responsability)
  end
end
