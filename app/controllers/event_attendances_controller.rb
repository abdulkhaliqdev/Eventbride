class EventAttendancesController < ApplicationController
  

  private

  def event_params
    params.require(:event_attendance).permit(:attended_event_id, :attendee_id)
  end

end
