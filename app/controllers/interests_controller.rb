class InterestsController < ApplicationController

  # skip_after_action :verify_authorized

  def create
    @event = Event.find(params[:event_id])
    @interest = Interest.new(event: @event, user: current_user)
    if @interest.save
    authorize @interest
      redirect_to event_path(@event)
    else
      render 'events/show', event: @event
    end
  end

  def destroy
    @interest = Interest.find(params[:id])
    authorize @interest
    # @event = @interest.event
    # @event.user = current_user
    @event = @interest.event
    @interest.destroy
    redirect_to event_path(@event)
  end

end
