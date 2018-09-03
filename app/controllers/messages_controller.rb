class MessagesController < ApplicationController
  before_action :set_chatroom
  include Pundit

  def create
    @message = Message.new(message_params)
    @message.audio = params[:blob]
    authorize @message
    @message.chatroom = @chatroom
    @message.user = current_user
    @message.save
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:audio, :content, :photo)
  end

end
