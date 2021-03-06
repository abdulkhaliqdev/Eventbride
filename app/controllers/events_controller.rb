class EventsController < ApplicationController
  def index
    @events = Event.all
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to root_path, notice: 'Event is successfully created.'
    else
      render :new, alert: 'Unable to create the Event'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    redirect_to current_user, notice: 'Event was successfully cencel' if @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:event, :description, :date)
  end
end
