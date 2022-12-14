class RatingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
  end

  def create?
    true
  end

  def destroy?
    record.booking.couple == user.couple
  end
end
