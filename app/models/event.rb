class Event < ApplicationRecord
  validates_presence_of :event, :description, :date

  belongs_to :creator, class_name: 'User'
  has_many :event_attendances, foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, through: 'event_attendances', source: 'attendee', class_name: 'User', foreign_key: 'user_id'

  scope :past, -> { where('date < ?', Time.now).order('date DESC') }
  scope :upcoming, -> { where('date >= ?', Time.now).order('date DESC') }
end
