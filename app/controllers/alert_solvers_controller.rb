class AlertSolversController < ApplicationController

  def create
    @alert = Alert.find(params[:alert_id])
    @alert_solver = AlertSolver.new
    @alert_solver.alert = @alert
    @alert_solver.user = current_user
    if @alert_solver.save
      @alert.status = true
      @alert.save
      @chatroom = @alert.chatroom
      redirect_to chatroom_path(@chatroom)
    else
      flash[:alert] = "The alert was not solved"
      render "chatrooms/show"
    end
  end

end



