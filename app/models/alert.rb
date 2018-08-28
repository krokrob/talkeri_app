
class Alert < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  has_many :alert_solvers
end
