class EventAttendancesController < ApplicationController
  def new
    @attended_event = EventAttendance.new
  end

  def create
    @attended_event = EventAttendance.new(event_attendance_params)

    if @attended_event.save
      redirect_to root_path, notice: 'You become the Attendee of the Event'
    else
      render :new, alert: 'Unable to become the Attendee of an the Event'
    end
  end

  private

  def event_attendance_params
    params.permit(:attended_event_id, :attendee_id)
  end
end
