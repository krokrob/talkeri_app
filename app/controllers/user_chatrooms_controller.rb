class UserChatroomsController < ApplicationController
  def create
    @userchatroom = UserChatroom.new(userchatroom_params)
    @event = Event.find(params[:event_id])
    authorize @userchatroom
    if @userchatroom.save
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end

  private

  def userchatroom_params
    params.require(:user_chatroom).permit(:user_id, :chatroom_id)
  end
end
