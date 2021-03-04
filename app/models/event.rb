class Event < ApplicationRecord
  validates_presence_of :event
  validates_presence_of :description
  validates_presence_of :date

  belongs_to :creator, class_name: 'User'
end
