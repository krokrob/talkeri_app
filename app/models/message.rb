class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  validates :content, presence: true, allow_blank: false
  mount_uploader :audio, AudioUploader

  def from?(some_user)
    user == some_user
  end
end
