class MessagesController < ApplicationController
  before_action :set_event

  def create
    @message = Message.new(message_params)
    @message.event = @event
    @message.user = current_user
    authorize @message
    if @message.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
