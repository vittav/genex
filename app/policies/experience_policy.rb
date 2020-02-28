class ExperiencePolicy < ApplicationPolicy

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    record.user == user
  end

  def destroy?
    # return false if record.meetings.any?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
