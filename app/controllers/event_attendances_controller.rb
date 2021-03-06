class EventAttendancesController < ApplicationController
  before_action :set_attended_event

  def new
    @attended_event = EventAttendance.new
  end

  def show; end

  def create
    @attended_event = EventAttendance.new(event_attendance_params)

    if @attended_event.save
      redirect_to root_path, notice: 'You become the Attendee of the Event'
    else
      redirect_to root_path, alert: 'Unable to attend event'
    end
  end

  def destroy
    @attended_event = EventAttendance.find_by(event_attendance_params)
    redirect_to current_user, notice: 'You have cancelled your attendance' if @attended_event.destroy
  end

  private

  def set_attended_event
    @attended_event = Event.find(event_attendance_params[:attended_event_id])
  end

  def event_attendance_params
    params.permit(:attended_event_id, :attendee_id)
  end
end
