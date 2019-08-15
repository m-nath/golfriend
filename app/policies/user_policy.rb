class UserPolicy < ApplicationPolicy
  def my_events?
    true
  end
end
