class User < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'

  has_many :attended_event, foreign_key: 'attendee_id', through: :event_attendances
  has_many :event_attendances
end
