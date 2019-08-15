class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show]

  def home
    @user = current_user
    # @events = Event.all.sample(12)
    @events = Event.geocoded.sample(12) #returns events with coordinates
    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: 'info_window', locals: { event: event }),
        image_url: helpers.asset_url('birdie.png'),
      }
    end
  end

  def show

  end
end
