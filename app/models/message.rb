class Message < ApplicationRecord
  acts_as_readable on: :created_at
  belongs_to :user
  belongs_to :chatroom
  belongs_to :alert_solver, optional: true
  mount_uploader :photo, PhotoUploader
  mount_uploader :audio, AudioUploader

  after_create_commit :broadcast_message, :broadcast_notification

  def from?(some_user)
    user == some_user
  end

  private

  def broadcast_message
    ActionCable.server.broadcast("chatroom_#{chatroom_id}", {
      message_partial: ApplicationController.renderer.render(partial: "messages/message", locals: { message: self.reload }),
      photo_url: self.user.photo.url,
      first_name_sender: self.user.first_name,
      photo_message: self.photo.url,
      sender_id: self.user.id
    })
  end

  def broadcast_notification
    chatroom.users.each do |u|
      unless u == user
        ActionCable.server.broadcast("notifications:notifications_for_#{u.id}", {
          channels_partial: ApplicationController.renderer.render(partial: "chatrooms/channel_list", locals: { event: chatroom.event, user: u })
        })
      end
    end
  end
end
