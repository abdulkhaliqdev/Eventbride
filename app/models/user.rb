class User < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'

  has_many :attended_event, source: 'attended_event', through: :event_attendances
  has_many :event_attendances, foreign_key: 'attendee_id'
end
