class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # .where(user: user)
    end
  end

  # do not need the new method, inherits from application policy
  def create?
    true
  end

  def show?
    true
  end

  def update?
    # if @event.user == current_user
    # if record.user == user
    #   return true
    # else
    #   return false
    # end

    # record.user == user ? true : false
    user_is_host_or_admin?
  end

  def destroy?
    user_is_host_or_admin?
  end

  private

  def user_is_host_or_admin?
    record.user == user # || user.admin
  end
end
