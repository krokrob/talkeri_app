class Chatroom < ApplicationRecord
  belongs_to :event
  has_many :messages
  has_many :alerts
  has_many :user_chatrooms
  has_many :users, through: :user_chatrooms
end
