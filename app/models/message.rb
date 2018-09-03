class Message < ApplicationRecord
  acts_as_readable on: :created_at
  belongs_to :user
  belongs_to :chatroom
  mount_uploader :photo, PhotoUploader
  mount_uploader :audio, AudioUploader

  def from?(some_user)
    user == some_user
  end
end
