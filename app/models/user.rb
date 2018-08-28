class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader
  has_many :messages
  has_many :user_events
  has_many :user_chatrooms
  has_many :events_as_participant, through: :user_events, source: :event
  has_many :events
  has_many :chatrooms, through: :user_chatrooms
  has_many :alerts
  has_many :alert_solvers

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
