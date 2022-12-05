class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      #   scope.all
      # user.admin? ? scope.all : scope.where(user: user)
      scope.where(couple: user.couple) # If users can only see their bookings
      # scope.where("name LIKE 't%'") # If users can only see meals starting with `t
    end
  end

  def show?
    record.user == user
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
