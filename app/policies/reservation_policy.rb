class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.event.user != user
  end

  def destroy
    record.event.user == user || record.user == user
    # record.event.user is the ppl who made booking
    # record record.user is the host
  end
end
