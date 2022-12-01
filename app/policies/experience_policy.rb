class ExperiencePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def mood?
    true
  end

  def index?
    true
  end

  def show?
    true
  end

  def favorite?
    true
  end

  def unfavorite?
    true
  end

  def my_favorite?
    true
  end
end
