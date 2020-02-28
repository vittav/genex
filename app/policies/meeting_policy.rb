class MeetingPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

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

  def my_meetings?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
