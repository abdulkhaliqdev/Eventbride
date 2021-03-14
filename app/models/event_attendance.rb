class EventAttendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

  scope :attendee_of_evvents, ->(id) { where('attendee_id = ?', id).order('attendee_id DESC') }
end
