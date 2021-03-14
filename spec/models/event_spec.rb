require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create(name: 'abdul khaliq', id: 1) }
  subject do
    Event.new(event: 'Ruby on rails', description: 'Event for ruby on rails', date: DateTime.now + 1.week,
              creator_id: user.id)
  end
  context 'validation of Event' do
    it 'Event is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'rejects if title not present' do
      subject.event = nil
      expect(subject).to_not be_valid
    end
    it 'rejects if description not present' do
      subject.description = nil
      expect(subject).to_not be_valid
    end
    it 'rejects if date not present' do
      subject.date = nil
      expect(subject).to_not be_valid
    end
    it 'rejects if user not present' do
      subject.creator_id = nil
      expect(subject).to_not be_valid
    end
  end
  context 'Event Associations' do
    it 'It belongs to Creator' do
      should belong_to(:creator)
    end
    it 'It has many events attendances' do
      should have_many(:event_attendances)
    end
    it 'It has many attnedees' do
      should have_many(:attendees)
    end
  end
end
