class AlertsController < ApplicationController
  before_action :set_chatroom
  include Pundit

  def create
  @alert = Alert.new(alert_params)
  authorize @alert
  @alert.chatroom = @chatroom
  @alert.user_id = current_user.id
    if @alert.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

 def alert_params
    params.require(:alert).permit(:content)
  end
end


