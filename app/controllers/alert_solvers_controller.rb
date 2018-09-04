class AlertSolversController < ApplicationController


  def create
    @alert = Alert.find(params[:alert_id])
    @alert_solver = AlertSolver.new
    authorize @alert_solver
    @alert_solver.alert = @alert
    @alert_solver.user = current_user
    if @alert_solver.save
      @alert.status = true
      @alert.save
      @chatroom = @alert.chatroom
      @message = Message.new()
      @message.chatroom = @chatroom
      @message.user = User.find_by(first_name: 'TalkeriBot')
      @message.alert_solver = @alert_solver
      @message.content = 'Well done team 🎉'
      @message.save
      redirect_to chatroom_path(@chatroom)
    else
      flash[:alert] = "The alert was not solved"
      render "chatrooms/show"
    end
  end

end



