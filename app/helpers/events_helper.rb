module EventsHelper
  def created_event_button
    render 'events/create_event_button' if user_signed_in?
  end

  def check_attendee(current_user, attendee)
    return true if current_user == attendee
  end

  def attendances_method(flag, current_user, event)
    if flag == true
      render 'events/cancelattendance'
    elsif user_signed_in? && current_user.id != event.creator_id
      render 'events/attendance_form'
    end
  end

  def create_partical(current_user, event)
    if user_signed_in? && current_user.id == event.creator.id
      render 'events/just_you'
    else
      render 'events/creator_name'
    end
  end
end
