class ChatroomPolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
