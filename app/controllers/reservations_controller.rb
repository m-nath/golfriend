class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    @event = Event.find(params[:event_id])
    @reservation.user = current_user
    @reservation.event = @event
    authorize @reservation
    if @reservation.save
      redirect_to event_path(@event)
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    @event.user = current_user
    authorize @event
    redirect_to event_path(@event)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @event = @reservation.event
    # @event.user = current_user
    @reservation.destroy
    redirect_to event_path(@event)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :event_id)
  end
end
