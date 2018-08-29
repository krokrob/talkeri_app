class UserEventPolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    record.event.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
