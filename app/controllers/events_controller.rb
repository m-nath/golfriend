class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @events = policy_scope(Event).order(created_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
    # authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event =  Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    @event.user = current_user
    @event.update(event_params)
    authorize @event
    redirect_to event_path(@event)
  end

  def destroy
    authorize @event
    @event = event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :photo, :photo_cache, :date, :location, :max_participants)
  end
end
