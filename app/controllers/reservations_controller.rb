class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    @event = Event.find(params[:event_id])
    @reservation.event = @event
    if @reservation.save
      redirect_to event_path(@event)
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    redirect_to event_path(@event)
  end

  def destory
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to event_path(@event)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user, :event)
  end
end
