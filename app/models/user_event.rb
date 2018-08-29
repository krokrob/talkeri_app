class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  RESPONSABILITIES = ['Organizer', 'Team leader', 'Staff']
end
