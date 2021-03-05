class EventAttendancesController < ApplicationController
  def new
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
