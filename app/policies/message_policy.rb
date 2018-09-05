class MessagePolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    new?
  end

  def mark_messsage_as_read?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
