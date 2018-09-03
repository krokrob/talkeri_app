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

  def edit?
    update?
  end

  def update?
    record.event.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
