require 'rails_helper'

RSpec.describe EventAttendance, type: :model do
  context 'Association of attendance' do
    it 'belongs to attendee' do
      should belong_to(:attendee)
    end
    it 'belongs to attended Event' do
      should belong_to(:attended_event)
    end
  end
end
