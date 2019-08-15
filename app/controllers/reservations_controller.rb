class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    @event = Event.find(params[:event_id])
    @event.user = current_user
    @reservation.event = @event
    authorize @event
    if @reservation.save
      redirect_to event_path(@event)
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    authorize @event
    redirect_to event_path(@event)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    authorize @event
    redirect_to event_path(@event)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :event_id)
  end
end
