require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { Event.new(event: 'Ruby on rails', description: 'Event for ruby on rails',date: DateTime.now + 1.week, user_id: 1 ) }
  context 'validation of Event' do
    it 'Event is valid with valid attributes' do
      user { User.find(1) }
      expect(subject).to be_valid
    end
    it 'rejects if tile not present' do
      subject.event = nil
      subject.description = 'Event arrange for Ruby on Rails'
      subject.date = '2021-04-20'
      subject.user_id = '1'

      expect(subject).to_not be_valid
    end
  end
end
