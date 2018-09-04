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
      first_name_sender: self.user.first_name
    })
  end

  def broadcast_notification
      # self.chatroom.users.each do |u|
      #   if u != self.user
      #     ActionCable.server.broadcast("notifications:notifications_for_#{u.id}", {
      #       # message: self.count_unread.to_json
      #   end
      # end
  end

  # def count_unread
  #   binding.pry

  # end
end
