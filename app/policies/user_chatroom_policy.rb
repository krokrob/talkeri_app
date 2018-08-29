class UserChatroomPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    record.chatroom.event.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
