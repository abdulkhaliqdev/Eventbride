class User < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name
  has_many :created_event, foreign_key: 'creator_id', class_name: 'Event', dependent: destroy
end
