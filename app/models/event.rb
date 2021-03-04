class Event < ApplicationRecord

  validates_presence_of :event
  validates_presence_of :description
  validates_presence_of :date
  validates_presence_of :user_id

  belongs_to :user
end
