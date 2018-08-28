class ChatroomPolicy < ApplicationPolicy

  def show?
    record.users.include?(user)
  end

  def new?
    true
  end

  def create?
    new?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
