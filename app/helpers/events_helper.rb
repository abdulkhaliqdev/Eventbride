module EventsHelper
  def created_event_button
    render 'events/create_event_button' if user_signed_in?
  end

  def check_attendee(current_user, attendee, flag)
    flag = true if current_user == attendee
  end

  def attendances_method
     render 'events/attendance_form'
    # if flag == true
    # render 'events/cancelattendance'
    # else
    #   if user_signed_in? && current_user.id != event.creator_id
    #   end
    # end
  end
end
