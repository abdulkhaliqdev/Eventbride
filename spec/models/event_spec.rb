require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create(name: 'abdul khaliq',id: 1) }
  subject { Event.new(event: 'Ruby on rails', description: 'Event for ruby on rails',date: DateTime.now + 1.week, user_id: user.id ) }
  context 'validation of Event' do
    it 'Event is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'rejects if tile not present' do
      subject.event = nil
      expect(subject).to_not be_valid
    end
  end
end
