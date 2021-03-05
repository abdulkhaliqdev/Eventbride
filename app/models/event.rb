class Event < ApplicationRecord
  validates_presence_of :event
  validates_presence_of :description
  validates_presence_of :date

  belongs_to :creator, class_name: 'User'
  has_many :attendees, through: :event_attendances, source: :attendee, class_name: 'User', foreign_key: 'user_id'
  has_many :event_attendances
end
