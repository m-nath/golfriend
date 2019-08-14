class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show]

  def home
    @events = Event.all
    @user = current_user
  end

  def show

  end
end
