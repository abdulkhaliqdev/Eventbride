class EventAttendancesController < ApplicationController
  def new
    @attended_event = EventAttendance.new
    @attended_event.attendee_id = current_user.id
    # @attended_event.attended_event_id = Event.find(params[:event_id])
  end

  def create
    @attended_event = EventAttendance.new(event_params)

    if @attended_event.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event_attendance).permit(:attended_event_id, :attendee_id)
  end
end
