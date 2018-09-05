class MessagesController < ApplicationController
  before_action :set_chatroom, except: :mark_messsage_as_read
  include Pundit

  def create
    @message = Message.new(message_params)
    @message.audio = params[:blob]
    authorize @message
    @message.chatroom = @chatroom
    @message.user = current_user
    @message.save
  end

  def mark_messsage_as_read
    @message = Message.find(params[:id])
    authorize @message
    @message.mark_as_read! for: current_user
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:audio, :audio_cache, :content, :photo, :photo_cache)
  end

end
