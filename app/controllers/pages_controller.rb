class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show]

  def home
    @events = Event.all.sample(9)
    @user = current_user
  end

  def show

  end
end
