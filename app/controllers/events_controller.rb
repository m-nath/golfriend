class EventsController < ApplicationController
  def index
    @events = policy_scope(Event).order(created_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
    # authorize @event
  end

  def new
    @event = Event.new
  end

  def create
    @event = event.new(event_params)
    authorize @event
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def destroy
    authorize @event
    @event = event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :photo, :date, :location, :max_participants)
  end
end