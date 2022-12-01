class SpecialDayPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(couple: user.couple)
    end
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end
end
