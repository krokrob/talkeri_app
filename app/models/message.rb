class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  mount_uploader :photo, PhotoUploader
  mount_uploader :audio, AudioUploader

  after_create_commit :broadcast_message

  def from?(some_user)
    user == some_user
  end

  private

  def broadcast_message
    ActionCable.server.broadcast("chatroom_#{chatroom_id}", {
      message_partial: ApplicationController.renderer.render(partial: "messages/message", locals: { message: self.reload })
    })
  end
end
