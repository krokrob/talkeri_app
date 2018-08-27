class Alert < ApplicationRecord
  belongs_to :chatroom
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  belongs_to :solver, :class_name => 'User', :foreign_key => 'solver_id'
end
