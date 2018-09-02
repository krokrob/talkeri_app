class MessagesController < ApplicationController
  before_action :set_chatroom
  include Pundit

  def create
    @message = Message.new(message_params)
    @message.audio = params[:blob]
    authorize @message
    @message.chatroom = @chatroom
    @message.user = current_user


    unless @message.audio.file.nil?
      if @message.save
        return render partial: "message", locals: { message: @message.reload }
      else
        render "problem"
      end
    end

    unless @message.content == ""
      if @message.save
        respond_to do |format|
          format.html { return render 'chatrooms/show' }
          format.js  # <-- idem
        end
      end
    end

    unless @message.photo.file.nil?
      if @message.save
        @message = @message.reload
        respond_to do |format|
          format.html { render 'chatrooms/show' }
          format.js  # <-- idem
        end
      end
    end

  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:audio, :content, :photo)
  end

end
