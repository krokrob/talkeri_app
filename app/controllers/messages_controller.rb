class MessagesController < ApplicationController
  before_action :set_chatroom

  def create
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    if @message.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[chatroom_id])
  end

  def message_params
    params.require(:message).permit(:audio, :content, :photo)
  end

end
